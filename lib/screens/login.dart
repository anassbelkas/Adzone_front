import 'package:adzone/widgets/alert/alert_animations.dart';
import 'package:flutter/material.dart';
import 'package:adzone/screens/reset_password.dart';
import 'package:adzone/screens/signup.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/widgets/login_form.dart';
import 'package:adzone/widgets/login_option.dart';
import 'package:adzone/widgets/navbar.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:adzone/providers/authentication.dart';
import 'package:adzone/widgets/alert/alert.dart';

class LogInScreen extends StatelessWidget {
  final LoginController _loginController = LoginController();
  final AuthenticationApi _authenticationApi = AuthenticationApi();
  bool _isDisabled = false;
  PrimaryButton _primaryButton = PrimaryButton(
    buttonText: 'Log In',
  );

  void _login(BuildContext context, Alert _alert) async {
    if (_isDisabled) {
      return;
    }
    if (_loginController.validate()) {
      _isDisabled = true;
      _primaryButton.changeState('animate');
      var formData = _loginController.getFormData();
      print(formData['email']);
      //delay 5 seconds

      _authenticationApi
          .login(formData['email'], formData['password'])
          .then((value) {
        if (value['success']) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Navbar(),
            ),
          );
        } else {
          _isDisabled = false;
          _primaryButton.changeState('idle');
          _loginController.setError(value['msg']);
          // _alert.showAlert(
          //     msg: value['msg'],
          //     title: 'Error',
          //     btnText: 'Ok',
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     animation: AlertAnimation.error);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    LogInForm _logInForm = LogInForm(controller: _loginController);
    Alert _alert = Alert(context);
    //run function after 5 seconds

    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
              ),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: kWhiteColor,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'New to this app?',
                    style: subTitle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _logInForm,
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen()));
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  _login(context, _alert);
                },
                child: _primaryButton,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Or log in with:',
                style: subTitle.copyWith(color: kWhiteColor),
              ),
              SizedBox(
                height: 20,
              ),
              LoginOption(),
            ],
          ),
        ),
      ),
      backgroundColor: kPrimaryColor,
    );
  }
}

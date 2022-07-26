import 'package:flutter/material.dart';
import 'package:adzone/screens/reset_password.dart';
import 'package:adzone/screens/signup.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/widgets/login_form.dart';
import 'package:adzone/widgets/login_option.dart';
import 'package:adzone/widgets/navbar.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:adzone/providers/authentication.dart';

class LogInScreen extends StatelessWidget {
  final LoginController _loginController = LoginController();
  final AuthenticationApi _authenticationApi = AuthenticationApi();

  @override
  Widget build(BuildContext context) {
    PrimaryButton _primaryButton = PrimaryButton(
      buttonText: 'Log In',
    );
    LogInForm _logInForm = LogInForm(controller: _loginController);
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
                  if (_loginController.validate()) {
                    _primaryButton.changeState('animate');
                    var formData = _loginController.getFormData();
                    print(formData['email']);
                    _authenticationApi
                        .login(formData['email'], formData['password'])
                        .then((value) {
                      print(value);
                      if (value['success']) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navbar(),
                          ),
                        );
                      } else {
                        _primaryButton.changeState('idle');
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text(value['msg']),
                            actions: [
                              FlatButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        );
                      }
                      // if (value) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Navbar(),
                      //     ),
                      //   );
                      // }
                    });
                  }
                  // _logInForm.validate();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Navbar()));
                  // _myController.onIncrement();
                  // print();
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

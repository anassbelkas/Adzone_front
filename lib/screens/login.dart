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
import 'package:material_dialogs/material_dialogs.dart';
import 'package:animations/animations.dart';

class LogInScreen extends StatelessWidget {
  final LoginController _loginController = LoginController();
  final AuthenticationApi _authenticationApi = AuthenticationApi();
  final SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.scaled;
  //constructor
  LogInScreen({Key key}) : super(key: key);

  bool _isDisabled = false;
  final PrimaryButton _primaryButton = PrimaryButton(
    buttonText: 'Sign in',
  );

  void _login(BuildContext context) async {
    if (_isDisabled) {
      return;
    }
    if (_loginController.validate()) {
      _isDisabled = true;
      _primaryButton.changeState('animate');
      var formData = _loginController.getFormData();
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
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    LogInForm _logInForm = LogInForm(controller: _loginController);
    //run function after 5 seconds
    _primaryButton.onPressed = () => _login(context);

    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 300),
      reverse: true,
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return SharedAxisTransition(
          child: child,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: _transitionType,
        );
      },
      child: Scaffold(
        body: Padding(
          padding: kDefaultPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                    //center child
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hello, again ',
                          //center text
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: kWhiteColor,
                          ),
                        ),
                        new RotationTransition(
                          turns: AlwaysStoppedAnimation(15 / 360),
                          child: Lottie.asset('animations/hand.json',
                              height: 50, width: 50),
                        )
                      ],
                    )),
                SizedBox(
                  height: 60,
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                        ),
                      ),
                    )),

                SizedBox(
                  height: 210,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: _primaryButton,
                ),

                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
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
                // Text(
                //   'Or log in with:',
                //   style: subTitle.copyWith(color: kWhiteColor),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // LoginOption(),
              ],
            ),
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}

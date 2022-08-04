import 'package:flutter/material.dart';
import 'package:adzone/screens/reset_password.dart';
import 'package:adzone/screens/signup.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/widgets/login_form.dart';
import 'package:adzone/widgets/navbar.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:adzone/providers/authentication.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:animations/animations.dart';
import 'package:sizer/sizer.dart';

class LogInScreen extends StatelessWidget {
  final LoginController _loginController = LoginController();
  final AuthenticationApi _authenticationApi = AuthenticationApi();
  final SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.scaled;
  final PrimaryButtonController _primaryButtonController =
      PrimaryButtonController();
  //constructor
  LogInScreen({Key key}) : super(key: key);

  bool _isDisabled = false;

  void _login(BuildContext context, Function changeState) async {
    if (_isDisabled) {
      return;
    }
    if (_loginController.validate()) {
      _isDisabled = true;
      changeState('animate');
      var formData = _loginController.getFormData();
      //delay 5 seconds

      _authenticationApi
          .login(formData['email'], formData['password'])
          .then((value) {
        if (value.success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Navbar(),
            ),
          );
        } else {
          _isDisabled = false;
          changeState('idle');
          _loginController.setError(value.message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final PrimaryButton _primaryButton = PrimaryButton(
      buttonText: 'Sign in',
      height: 7.h,
      width: 70.w,
      controller: _primaryButtonController,
    );
    LogInForm _logInForm = LogInForm(controller: _loginController);
    //run function after 5 seconds
    _primaryButton.onPressed =
        () => _login(context, _primaryButtonController.changeState);

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
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: kDefaultPadding,
          child: Stack(children: [
            Positioned(
                bottom: 0,
                //center the child
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_primaryButton],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: subTitle,
                        ),
                        SizedBox(
                          width: 2.w,
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
                      height: 3.h,
                    )
                  ],
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Container(
                    //center child
                    height: 20.h,
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

                _logInForm,
                SizedBox(
                  height: 3.h,
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

                // Text(
                //   'Or log in with:',
                //   style: subTitle.copyWith(color: kWhiteColor),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // LoginOption(),
              ],
            )
          ]),
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}

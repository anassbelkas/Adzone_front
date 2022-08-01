import 'package:adzone/providers/authentication.dart';
import 'package:adzone/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:adzone/screens/login.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:adzone/widgets/reset_form.dart';
import 'package:adzone/widgets/return_arrow.dart';

class ResetPasswordScreen extends StatelessWidget {
  final ResetController controller = ResetController();

  @override
  Widget build(BuildContext context) {
    final ResetForm _resetForm = ResetForm(controller: controller);
    final AuthenticationApi _authenticationApi = AuthenticationApi();
    final PrimaryButton _primaryButton =
        PrimaryButton(buttonText: 'Reset Password');
    _primaryButton.onPressed = () {
      if (controller.validate()) {
        _authenticationApi
            .resetPassword(controller.getEmail())
            .then((value) => {
                  if (value.success)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessScreen(
                                    text:
                                        'Your password has been reset successfully. Please check your email for the new password.',
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LogInScreen())),
                                  )))
                    }
                });
      }
    };
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReturnArrow(),
          Padding(
            padding: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //return arrow back
                // ReturnArrow(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: kWhiteColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Please enter your email address',
                  style: subTitle.copyWith(fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 50,
                ),
                _resetForm,
                SizedBox(
                  height: 350,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: _primaryButton,
                )
              ],
            ),
          )
        ],
      ),
      backgroundColor: kPrimaryColor,
    );
  }
}

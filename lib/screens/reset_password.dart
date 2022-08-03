import 'package:adzone/providers/authentication.dart';
import 'package:adzone/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:adzone/screens/login.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:adzone/widgets/reset_form.dart';
import 'package:adzone/widgets/return_arrow.dart';
import 'package:sizer/sizer.dart';

class ResetPasswordScreen extends StatelessWidget {
  final ResetController controller = ResetController();

  @override
  Widget build(BuildContext context) {
    final ResetForm _resetForm = ResetForm(controller: controller);
    final AuthenticationApi _authenticationApi = AuthenticationApi();
    final PrimaryButton _primaryButton = PrimaryButton(
      buttonText: 'Reset Password',
      width: 70.w,
      height: 7.h,
    );
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
      body: Stack(children: [
        Positioned(
            child: Padding(
              child: _primaryButton,
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            ),
            bottom: 0,
            left: 0,
            right: 0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReturnArrow(
              inverse: true,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //return arrow back
                  // ReturnArrow(),

                  Container(
                    width: double.infinity,
                    height: 18.h,
                    child: Column(children: [
                      SizedBox(
                        height: 5.h,
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
                        height: 2.h,
                      ),
                      Text(
                        'Please enter your email address',
                        style: subTitle.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  _resetForm,
                ],
              ),
            )
          ],
        )
      ]),
      backgroundColor: kPrimaryColor,
    );
  }
}

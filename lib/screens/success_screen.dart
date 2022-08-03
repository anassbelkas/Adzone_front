import 'package:adzone/screens/login.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:adzone/widgets/alert/animations.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:sizer/sizer.dart';

class SuccessScreen extends StatelessWidget {
  String text;
  TextStyle textStyle;
  VoidCallback onPressed;

  SuccessScreen(
      {@required this.text,
      @required this.onPressed,
      this.textStyle = const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )});

  @override
  Widget build(BuildContext context) {
    final PrimaryButton _primaryButton = PrimaryButton(
      height: 7.h,
      width: 70.w,
      buttonText: 'Return',
      inverse: true,
    );
    _primaryButton.onPressed = onPressed;
    return Scaffold(
      body: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Stack(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Positioned(
                        child: Padding(
                          child: _primaryButton,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                        ),
                        bottom: 0,
                        left: 0,
                        right: 0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          Animations.success,
                          repeat: false,
                          height: 40.h,
                          width: 70.w,
                        ),
                        SizedBox(
                          width: 70.w,
                          child: Text(
                            //align center

                            text,
                            textAlign: TextAlign.center,
                            style: textStyle,
                          ),
                        )
                      ],
                    ),
                  ]))),
    );
  }
}

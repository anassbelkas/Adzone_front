import 'package:adzone/screens/login.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:adzone/widgets/alert/animations.dart';
import 'package:material_dialogs/material_dialogs.dart';

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
                    Align(
                        alignment: Alignment(0, -1),
                        child: Lottie.asset(
                          Animations.success,
                          repeat: false,
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                        )),
                    Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          //align center

                          text,
                          textAlign: TextAlign.center,
                          style: textStyle,
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                        child: _primaryButton,
                      ),
                    )
                  ]))),
    );
  }
}

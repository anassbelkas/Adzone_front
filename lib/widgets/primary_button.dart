import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PrimaryButtonController {
  Function changeState;

  void dispose() {
    changeState = null;
  }
}

class PrimaryButton extends StatefulWidget {
  String buttonText;
  Function onPressed;
  bool inverse;
  Color borderColor;
  double width;
  double height;
  PrimaryButtonController controller;
  PrimaryButton(
      {@required this.buttonText,
      this.onPressed,
      this.inverse = false,
      this.borderColor = kWhiteColor,
      this.width = double.infinity,
      this.height = 50,
      this.controller});
  @override
  State<StatefulWidget> createState() => _PrimaryButton();
}

class _PrimaryButton extends State<PrimaryButton> {
  String buttonText;
  String initialText;
  bool isAnimated = false;
  bool inverse;
  Color borderColor;
  double width;
  double height;

  @override
  void initState() {
    super.initState();
    buttonText = widget.buttonText;
    initialText = buttonText;
    inverse = widget.inverse;
    borderColor = widget.borderColor;
    width = widget.width;
    height = widget.height;
    widget.controller?.changeState = (state) {
      if (state == 'animate') {
        setState(() {
          buttonText = "Loading...";
          isAnimated = true;
        });
      } else {
        setState(() {
          buttonText = initialText;
          isAnimated = false;
        });
      }
    };
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          if (isAnimated) {
            return;
          }
          widget.onPressed();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              inverse ? kPrimaryColor : Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: inverse ? kPrimaryColor : borderColor,
                width: 1,
              ),
            ),
          ),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.08,
          width: double.infinity,
          child: isAnimated
              ? SpinKitCircle(
                  color: borderColor,
                  size: 30,
                )
              : Text(
                  buttonText,
                  style: textButton.copyWith(color: borderColor),
                ),
        ),
      ),
    );
  }
}

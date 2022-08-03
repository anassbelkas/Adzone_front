import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:eventify/eventify.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final EventEmitter emitter = new EventEmitter();

class PrimaryButton extends StatefulWidget {
  String buttonText;
  Function onPressed;
  bool inverse;
  Color borderColor;
  double width;
  double height;
  PrimaryButton(
      {@required this.buttonText,
      this.onPressed,
      this.inverse = false,
      this.borderColor = kWhiteColor,
      this.width = double.infinity,
      this.height = 50});
  _PrimaryButton __primaryButton = _PrimaryButton();
  @override
  State<StatefulWidget> createState() {
    return __primaryButton;
  }

  //change state
  void changeState(String state) {
    emitter.emit('changeState', this, state);
  }
}

class _PrimaryButton extends State<PrimaryButton> {
  String buttonText;
  bool isAnimated = false;
  bool inverse;
  Color borderColor;
  double width;
  double height;

  @override
  void initState() {
    super.initState();
    buttonText = widget.buttonText;
    inverse = widget.inverse;
    borderColor = widget.borderColor;
    width = widget.width;
    height = widget.height;
  }

  @override
  Widget build(BuildContext context) {
    emitter.on('changeState', null, (ev, ctx) {
      if (ev.eventData == 'animate') {
        setState(() {
          buttonText = "Loading...";
          isAnimated = true;
        });
      } else {
        setState(() {
          buttonText = "Sign in";
          isAnimated = false;
        });
      }
    });
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

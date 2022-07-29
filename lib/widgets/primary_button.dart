import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:eventify/eventify.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final EventEmitter emitter = new EventEmitter();

class PrimaryButton extends StatefulWidget {
  String buttonText;
  Function onPressed;
  PrimaryButton({@required this.buttonText});
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
  // _PrimaryButton({@required this.buttonText});

  @override
  Widget build(BuildContext context) {
    buttonText = widget.buttonText;
    // buttonText = 'Log In';
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
    return ElevatedButton(
      onPressed: () {
        if (isAnimated) {
          return;
        }
        widget.onPressed();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: kWhiteColor,
              width: 1,
            ),
          ),
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.08,
        width: double.infinity,
        child: isAnimated
            ? SpinKitCircle(
                color: kWhiteColor,
                size: 30,
              )
            : Text(
                buttonText,
                style: textButton.copyWith(color: kWhiteColor),
              ),
      ),
    );
  }
}

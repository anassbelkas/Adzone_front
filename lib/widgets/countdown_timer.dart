import 'dart:async';

import 'package:flutter/material.dart';

//countdown controller
class CountdownController {
  VoidCallback onFinish;
  bool isRunning;
  VoidCallback reset;
  VoidCallback start;

  void dispose() {
    onFinish = null;
  }
}

class CountdownTimer extends StatefulWidget {
  final Duration duration;
  final TextStyle textStyle;
  final CountdownController controller;
  //constructor
  CountdownTimer(
      {@required this.duration, this.textStyle, @required this.controller});
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  // Step 2
  Timer countdownTimer;
  Duration myDuration;
  TextStyle myTextStyle;
  @override
  void initState() {
    myDuration = widget.duration;
    myTextStyle =
        widget.textStyle ?? const TextStyle(fontSize: 14, color: Colors.white);
    widget.controller.start = () {
      startTimer();
    };
    widget.controller.reset = () {
      resetTimer();
    };

    startTimer();
    super.initState();
  }

  @override
  void setState(fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    widget.controller.isRunning = true;
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = widget.duration);
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer.cancel();
        widget.controller.isRunning = false;
        widget.controller.onFinish();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return
        // Step 8
        Text(
      myDuration.inHours.remainder(24) == 0
          ? '$minutes:$seconds'
          : '$hours:$minutes:$seconds',
      style: myTextStyle,
    );
  }
}

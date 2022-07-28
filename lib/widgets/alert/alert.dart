import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class Alert {
  BuildContext context;
  Alert(this.context);

  void showAlert(
      {String msg,
      String title,
      String btnText,
      Function onPressed,
      String animation}) {
    Dialogs.materialDialog(
        color: Colors.white,
        msg: msg,
        title: title,
        lottieBuilder: Lottie.asset(
          animation,
          width: 200,
          height: 200,
          fit: BoxFit.contain,
          repeat: true,
        ),
        context: context,
        actions: [
          IconsButton(
            onPressed: onPressed,
            text: btnText,
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }
}

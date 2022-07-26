import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';

class ResetForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: kWhiteColor),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kWhiteColor))),
      ),
    );
  }
}

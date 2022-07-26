import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/main.dart';

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: kDefaultPadding,
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(
                  height: 120,
                ),
                Text(
                  'Cam',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ]))),
    );
  }
}

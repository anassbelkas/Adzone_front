import 'package:flutter/material.dart';
import 'package:login_signup_ui_starter/theme.dart';
import 'package:login_signup_ui_starter/main.dart';
import 'package:login_signup_ui_starter/screens/cam.dart';
import 'package:login_signup_ui_starter/screens/profil.dart';
import 'package:login_signup_ui_starter/screens/map.dart';

class Home extends StatelessWidget {
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
                'home',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ]
          )
        )
      ),
    );
  }
}


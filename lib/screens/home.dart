import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/main.dart';
import 'package:adzone/screens/cam.dart';
import 'package:adzone/screens/profil.dart';
import 'package:adzone/screens/map.dart';

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
              ]))),
    );
  }
}

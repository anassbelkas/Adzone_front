import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';

class NewsScreen extends StatelessWidget {
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
                  'News',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 7, 61, 255),
                  ),
                ),
              ]))),
    );
  }
}

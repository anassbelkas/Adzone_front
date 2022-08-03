import 'package:adzone/screens/notifications/components/body.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
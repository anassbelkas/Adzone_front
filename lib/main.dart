import 'package:adzone/screens/login.dart';
import 'package:adzone/screens/profil.dart';
import 'package:adzone/screens/signup.dart';
import 'package:adzone/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:adzone/routes.dart';
import 'package:adzone/widgets/navbar.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'DM Sans'),
        home: Navbar(),
        routes: routes,
      );
    }));
  }
}

import 'package:flutter/material.dart';
import 'package:login_signup_ui_starter/screens/login.dart';
import 'package:login_signup_ui_starter/theme.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
@override
void initState() {
  super.initState();
  //_navigatetohome();
}
/*
_navigatetohome() async{
  await Future.delayed(Duration(milliseconds: 2500), () {});
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
}
*/
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Image(image: AssetImage('images/AD.png'),),
        duration: 2000,
        nextScreen: LogInScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: kWhiteColor);
  }
}

/*

Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [/*
            Container(
              child: Text('Scan, Watch  \n  and EARN \n    with ', 
                style: titleText2,
              ),
            ),*/
            Container(
              child: Image(
                
                    width: 600, 
                image: AssetImage('images/AD.png'),)
            ),
          ],
        ),
      ),
      backgroundColor: kPrimaryColor,
    );





AnimatedSplashScreen(
        splash: 
              Text(
                'Welcome to \n'
                'AD ZONE',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              /*Text(
                'AD ZONE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),*/
            
          
        duration: 3000,
        nextScreen: LogInScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: kPrimaryColor);
        */ 
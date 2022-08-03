import 'package:adzone/screens/login.dart';
import 'package:adzone/screens/signup.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    PrimaryButton _signUpButton = PrimaryButton(
      height: 7.h,
      width: 80.w,
      buttonText: 'Create an account',
      borderColor: kPrimaryColor,
    );
    PrimaryButton _signInButton = PrimaryButton(
      height: 7.h,
      width: 80.w,
      buttonText: 'Sign in',
      inverse: true,
    );
    _signUpButton.onPressed = () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        ),
      );
    };
    _signInButton.onPressed = () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LogInScreen(),
        ),
      );
    };
    var particlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;
    ParticleOptions particleOptions = const ParticleOptions(
      baseColor: Colors.red,
      spawnOpacity: 0.0,
      opacityChangeRate: 0.25,
      minOpacity: 0.1,
      maxOpacity: 0.4,
      spawnMinSpeed: 30.0,
      spawnMaxSpeed: 50.0,
      spawnMinRadius: 7.0,
      spawnMaxRadius: 15.0,
      particleCount: 40,
    );
    return Scaffold(
      backgroundColor: kadzone,
      resizeToAvoidBottomInset: false,
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
            paint: particlePaint, options: particleOptions),
        vsync: this,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                // Image.asset('images/AD.png', width: 250,),
                SizedBox(
                  height: 10.w,
                ),
                Container(
                    alignment: Alignment.center,
                    height: 18.h,
                    child: Text(
                      "Scan, Watch and EARN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30.h,
                  child: Image.asset(
                    'images/AD.png',
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                _signInButton,
                SizedBox(
                  height: 5.w,
                ),
                _signUpButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:adzone/screens/login.dart';
import 'package:adzone/screens/signup.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    PrimaryButton _signUpButton = PrimaryButton(
      buttonText: 'Create an account',
      borderColor: kPrimaryColor,
    );
    PrimaryButton _signInButton = PrimaryButton(
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
                // SizedBox(height: 18,),
                SizedBox(
                  height: 50,
                ),

                Text(
                  "Scan, Watch and EARN",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset(
                    'images/AD.png',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 150,
                ),
                SizedBox(
                  width: double.infinity,
                  child: _signInButton,
                ),
                SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: double.infinity,
                  child: _signUpButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

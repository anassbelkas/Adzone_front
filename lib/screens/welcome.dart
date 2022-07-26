import 'package:adzone/screens/login.dart';
import 'package:adzone/screens/signup.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({ Key key }) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              // Image.asset('images/AD.png', width: 250,),
              // SizedBox(height: 18,),
              SizedBox(
                height: 18,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'images/A(2).png',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text("Let's get started", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text("Never a better time than now to start.  ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black38),),
              SizedBox(height: 38,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen(),),);
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(kWhiteColor),
                    backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)))
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Text(
                      'Create Account',
                      style: TextStyle(fontSize: 16),
                    )
                    ),
                ),
              ),
              SizedBox(height: 22,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogInScreen(),),);
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                    backgroundColor: MaterialStateProperty.all<Color>(kWhiteColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)))
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    )
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
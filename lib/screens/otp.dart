import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spring/spring.dart';

class OTPScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String userEmail;
  OTPScreen({Key key, @required this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 104,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Text(
                  'Enter your verification code',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.workSans().fontFamily,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Enter the 6-characters code we have sent to',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: GoogleFonts.workSans().fontFamily,
                  ),
                ),
                Text(
                  userEmail,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: GoogleFonts.workSans().fontFamily,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                    height: 70,
                    width: size.width,
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    decoration: BoxDecoration(
                      // color: Colors.purple,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VerificationTextField(first: true, last: false),
                          VerificationTextField(first: false, last: false),
                          VerificationTextField(first: false, last: false),
                          VerificationTextField(first: false, last: false),
                          VerificationTextField(first: false, last: false),
                          VerificationTextField(first: false, last: true),
                        ],
                      ),
                    )),
                SizedBox(height: 41),
                Text(
                  'Didn’t receive the code?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.workSans().fontFamily,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Resend code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    fontFamily: GoogleFonts.workSans().fontFamily,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            // color: Colors.blue,
            height: 103,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  //disable button when textfield is empty

                  onPressed: () {
                    _formKey.currentState.validate();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF161616),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    fixedSize: Size(325, 50),
                  ),
                  child: Text(
                    'Send code',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 88,
          ),
        ],
      ),
    );
  }
}

class VerificationTextField extends StatefulWidget {
  final bool first;
  final bool last;
  VerificationTextField({this.first, this.last});
  @override
  _VerificationTextFieldState createState() => _VerificationTextFieldState();
}

class _VerificationTextFieldState extends State<VerificationTextField> {
  final SpringController _springController =
      SpringController(initialAnim: Motion.pause);
  Color _borderColor = Colors.grey.withOpacity(0.6);
  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return Spring.shake(
        animDuration: Duration(milliseconds: 500),
        springController: _springController,
        child: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: _borderColor,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset.zero,
              ),
            ],
          ),
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                setState(() {
                  _borderColor = kErrorColor;
                });
                _springController.play();
                return null;
              }
              return null;
            },
            textAlign: TextAlign.center,
            focusNode: focusNode,
            maxLength: 1,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  _borderColor = Colors.grey.withOpacity(0.6);
                  _springController.play(motion: Motion.pause);
                });
              }
              if (value.length == 1 && !widget.last) {
                focusNode.nextFocus();
              } else if (value.length == 0 && !widget.first) {
                focusNode.previousFocus();
              }
            },
            style: TextStyle(
              fontSize: 28,
            ),
            decoration: InputDecoration(
              counterText: "",
              // no border
              border: InputBorder.none,
            ),
          ),
        ));
  }
}

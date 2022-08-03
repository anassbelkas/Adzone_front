import 'package:adzone/providers/authentication.dart';
import 'package:adzone/screens/login.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/widgets/countdown_timer.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spring/spring.dart';
import 'package:sizer/sizer.dart';

class OTPScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthenticationApi _api = AuthenticationApi();
  String userEmail;
  OTPScreen({Key key, @required this.userEmail}) : super(key: key);
  final PrimaryButton _primaryButton = PrimaryButton(
    buttonText: 'Verify',
  );
  //6 text controllers for the 6 digits of the OTP
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();
  final _textController3 = TextEditingController();
  final _textController4 = TextEditingController();
  final _textController5 = TextEditingController();
  final _textController6 = TextEditingController();

  // concatenate the 6 text controllers to get the OTP
  String getOTP() {
    return _textController1.text +
        _textController2.text +
        _textController3.text +
        _textController4.text +
        _textController5.text +
        _textController6.text;
  }

  @override
  Widget build(BuildContext context) {
    CountdownController _countdownController = CountdownController();
    _primaryButton.onPressed = () {
      // print(_formKey.currentState.validate());
      // print(getOTP());

      if (_formKey.currentState.validate()) {
        _primaryButton.changeState('animate');
        _api.verifyAccount(getOTP()).then((value) {
          if (value.success) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LogInScreen(),
              ),
            );
          } else {
            _primaryButton.changeState('idle');
            _formKey.currentState.reset();
            _textController1.clear();
            _textController2.clear();
            _textController3.clear();
            _textController4.clear();
            _textController5.clear();
            _textController6.clear();
          }
        });
      }
    };

    _countdownController.onFinish = () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => LogInScreen(),
      //   ),
      // );
    };
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        Positioned(
            child: Padding(
                child: _primaryButton,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h)),
            bottom: 0,
            left: 0,
            right: 0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.5.w),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 7.h,
                child: Text(
                  'Enter your verification code',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor),
                ),
              ),
              Container(
                height: 10.h,
                child: Column(
                  children: [
                    Text(
                      'Enter the 6-characters code we have sent to',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kWhiteColor,
                      ),
                    ),
                    Text(
                      userEmail,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: kWhiteColor),
                    )
                  ],
                ),
              ),
              Container(
                  height: 7.h,
                  width: 100.w,
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
                        VerificationTextField(
                          first: true,
                          last: false,
                          controller: _textController1,
                        ),
                        VerificationTextField(
                          first: false,
                          last: false,
                          controller: _textController2,
                        ),
                        VerificationTextField(
                          first: false,
                          last: false,
                          controller: _textController3,
                        ),
                        VerificationTextField(
                          first: false,
                          last: false,
                          controller: _textController4,
                        ),
                        VerificationTextField(
                          first: false,
                          last: false,
                          controller: _textController5,
                        ),
                        VerificationTextField(
                          first: false,
                          last: true,
                          controller: _textController6,
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 5.h),
              Text(
                'Didn’t receive the code?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: kWhiteColor,
                ),
              ),
              SizedBox(height: 2.h),
              ResendCode(email: userEmail, api: _api),
            ],
          ),
        )
      ]),
      backgroundColor: kPrimaryColor,
    );
  }
}

class VerificationTextField extends StatefulWidget {
  final bool first;
  final bool last;
  final TextEditingController controller;
  VerificationTextField({this.first, this.last, this.controller});
  @override
  _VerificationTextFieldState createState() => _VerificationTextFieldState();
}

class _VerificationTextFieldState extends State<VerificationTextField> {
  FocusNode _focus = FocusNode();
  final SpringController _springController =
      SpringController(initialAnim: Motion.pause);
  Color _borderColor = kWhiteColor;
  double _borderWidth = 1;

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
            //border
            border: Border.all(
              color: _borderColor,
              width: _borderWidth,
            ),
          ),
          child: TextFormField(
            controller: widget.controller,
            validator: (value) {
              if (value.isEmpty) {
                setState(() {
                  _borderColor = kErrorColor;
                  _borderWidth = 1;
                });
                _springController.play();
                return '';
              }
              return null;
            },
            textAlign: TextAlign.center,
            focusNode: focusNode,
            maxLength: 1,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  _borderColor = kWhiteColor;
                  _borderWidth = 1;
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
              fontSize: 24,
            ),
            decoration: InputDecoration(
              counterText: "",
              //error style transparent
              errorStyle: TextStyle(fontSize: 2, height: 0),
              //invisible error style

              // no border
              border: InputBorder.none,
            ),
          ),
        ));
  }
}

class ResendCode extends StatefulWidget {
  String email;
  AuthenticationApi api;
  ResendCode({@required this.email, @required this.api});

  @override
  _ResendCodeState createState() => _ResendCodeState();
}

class _ResendCodeState extends State<ResendCode> {
  final CountdownController _countdownController = CountdownController();
  final SpringController _springController =
      SpringController(initialAnim: Motion.pause);
  CountdownTimer _countdownTimer;
  int animationState = 0;
  @override
  void initState() {
    super.initState();
    _countdownTimer = CountdownTimer(
      duration: Duration(minutes: 2),
      controller: _countdownController,
    );
    _countdownController.onFinish = () {
      setState(() {
        _countdownController.reset();
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (!_countdownController.isRunning) {
                  widget.api.resendVerificationCode(widget.email).then((value) {
                    if (value.success) {
                      setState(() {
                        _springController.play(motion: Motion.play);
                        _countdownController.start();
                      });
                    } else {
                      print(value.message);
                    }
                  });
                }
              },
              child: Text(
                'Resend code',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    color: kWhiteColor),
              ),
            ),
            //countdown timer 2 minutes
            SizedBox(width: 10),
            if (_countdownController.isRunning == null ||
                _countdownController.isRunning)
              _countdownTimer
          ],
        ),
        //sent successfully text
        SizedBox(height: 10),
        Spring.fadeIn(
          springController: _springController,
          animDuration: Duration(milliseconds: 2000),
          animStatus: (status) {
            if (status == AnimStatus.completed) {
              if (animationState == 0) {
                _springController.play(motion: Motion.reverse);
              } else {
                _springController.play(motion: Motion.pause);
                animationState = 0;
              }
            }
          },
          child: Text(
            'Sent successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kWhiteColor,
            ),
          ),
        ),
      ],
    );
  }
}

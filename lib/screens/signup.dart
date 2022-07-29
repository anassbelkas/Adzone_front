import 'package:adzone/screens/otp.dart';
import 'package:flutter/material.dart';
import 'package:adzone/screens/login.dart';
import 'package:adzone/theme.dart';
import 'package:adzone/widgets/checkbox.dart';
import 'package:adzone/widgets/login_option.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:adzone/widgets/signup_form.dart';
import 'package:adzone/providers/authentication.dart';

class SignUpScreen extends StatelessWidget {
  SignUpController _signUpController = SignUpController();
  final AuthenticationApi _authenticationApi = AuthenticationApi();
  PrimaryButton _primaryButton = PrimaryButton(
    buttonText: 'Sign Up',
  );
  CheckBoxController _checkBoxController = CheckBoxController();
  CheckBoxController _checkBoxController2 = CheckBoxController();
  bool _isDisabled = false;

  void _signUp(BuildContext context) async {
    if (_signUpController.validate()) {
      if (_checkBoxController.validate() && _checkBoxController2.validate()) {
        _isDisabled = true;
        _primaryButton.changeState('animate');
        var formData = _signUpController.getFormData();
        print(formData['email']);
        //delay 5 seconds
        _authenticationApi
            .signup(formData['firstName'], formData['lastName'],
                formData['email'], formData['password'])
            .then((value) {
          if (value['success']) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => OTPScreen(userEmail: formData['email']),
              ),
            );
          } else {
            _primaryButton.changeState('idle');
            _signUpController.setError(value['msg']);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SignUpForm _signUpForm = SignUpForm(controller: _signUpController);
    CheckBox _checkBox = CheckBox('I agree to the terms and conditions',
        controller: _checkBoxController);
    CheckBox _checkBox2 = CheckBox('I have at least 18 years old.',
        controller: _checkBoxController2);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: kWhiteColor,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Row(
                children: [
                  Text(
                    'Already a member?',
                    style: subTitle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInScreen()));
                    },
                    child: Text(
                      'Log In',
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: kDefaultPadding,
              child: _signUpForm,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: _checkBox,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: _checkBox2,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: GestureDetector(
                onTap: () {
                  if (!_isDisabled) {
                    _signUp(context);
                  }
                },
                child: _primaryButton,
              ),
            ),
            // Padding(
            //   padding: kDefaultPadding,
            //   child: PrimaryButton(buttonText: 'Sign Up'),
            // ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Or log in with:',
                style: subTitle.copyWith(color: kWhiteColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: LoginOption(),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      backgroundColor: kPrimaryColor,
    );
  }
}

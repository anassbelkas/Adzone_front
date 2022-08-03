import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:sizer/sizer.dart';

class SignUpController {
  var validate;
  var getFormData;
  var setError;

  void dispose() {
    validate = null;
    getFormData = null;
    setError = null;
  }
}

class SignUpForm extends StatefulWidget {
  final SignUpController controller;
  SignUpForm({
    @required this.controller,
  }) : assert(controller != null);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscure = true;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String errorMessage = '';
  @override
  void initState() {
    super.initState();
    widget.controller.validate = () {
      //check validation form fields
      if (_formKey.currentState.validate()) {
        //validation success
        return true;
      }
      return false;
    };
    widget.controller.getFormData = () {
      //return form fields as json
      return {
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      };
    };
    widget.controller.setError = (String error) {
      //set error message
      setState(() {
        errorMessage = error;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: buildInputForm('First Name', false, (value) {
                if (value.isEmpty) {
                  return 'First Name is required';
                }
                return null;
              }, controller: _firstNameController),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: buildInputForm('Last Name', false, (value) {
                if (value.isEmpty) {
                  return 'Last Name is required';
                }
                return null;
              }, controller: _lastNameController),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: buildInputForm('Email', false, (value) {
                if (value.isEmpty) {
                  return 'Email is required';
                }
                //check email format
                if (!RegExp(
                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                    .hasMatch(value)) {
                  return 'Email is not valid';
                }
                return null;
              }, controller: _emailController, error: true),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: buildInputForm('Password', true, (value) {
                if (value.isEmpty) {
                  return 'Password is required';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              }, controller: _passwordController),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: buildInputForm('Confirm Password', true, (value) {
                if (value != _passwordController.text) {
                  return 'Password and Confirm Password must be same';
                }
                return null;
              }, controller: _confirmPasswordController),
            ),
          ],
        ));
  }

  SizedBox buildInputForm(String hint, bool pass, Function validator,
      {TextEditingController controller, bool error = false}) {
    return SizedBox(
      height: 9.5.h,
      child: TextFormField(
        validator: ((value) => validator(value)),
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          helperText: ' ',
          hintText: hint,
          errorText: error
              ? errorMessage.isEmpty
                  ? null
                  : errorMessage
              : null,
          hintStyle: TextStyle(color: Color(0xFF979797)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: pass
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: _isObscure
                      ? Icon(
                          Icons.visibility_off,
                          color: Color(0xFF979797),
                        )
                      : Icon(
                          Icons.visibility,
                          color: Color(0xFF979797),
                        ))
              : null,
        ),
      ),
    );
  }
}

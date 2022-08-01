import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';

class ResetController {
  var validate;
  var getEmail;

  void dispose() {
    validate = null;
    getEmail = null;
  }
}

class ResetForm extends StatelessWidget {
  final ResetController controller;
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ResetForm({
    @required this.controller,
  }) : assert(controller != null);
  @override
  Widget build(BuildContext context) {
    controller.getEmail = () {
      return emailController.text;
    };
    controller.validate = () {
      if (_formKey.currentState.validate()) {
        return true;
      }
      return false;
    };
    return Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(
                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Color(0xFF9B9B9B)),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: kWhiteColor),
                ),
                fillColor: Colors.white,
              ),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:login_signup_ui_starter/theme.dart';
import 'package:eventify/eventify.dart';

final EventEmitter emitter = new EventEmitter();

class LogInForm extends StatefulWidget {
  final _LogInFormState _formState = _LogInFormState();
  @override
  _LogInFormState createState() => _formState;
  //return form fields as json
  Map<String, dynamic> getFormFields() {
    return {
      'email': _formState._emailController.text,
      'password': _formState._passwordController.text,
    };
  }

  //validate emitter
  void validate() {
    emitter.emit('validate', this);
  }
}

class _LogInFormState extends State<LogInForm> {
  bool _isObscure = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    emitter.on('validate', null, (ev, ctx) {
      _formKey.currentState.validate();
    });
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildInputForm('Email', false, _emailController),
          buildInputForm('Password', true, _passwordController),
        ],
      ),
    );
  }

  Padding buildInputForm(
      String label, bool pass, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: pass ? _isObscure : false,
        controller: controller,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: kWhiteColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kWhiteColor),
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
                            color: kWhiteColor,
                          )
                        : Icon(
                            Icons.visibility,
                            color: kWhiteColor,
                          ),
                  )
                : null),
      ),
    );
  }
}

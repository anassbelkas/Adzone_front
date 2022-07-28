import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:eventify/eventify.dart';

final EventEmitter emitter = new EventEmitter();

class LoginController {
  var validate;
  var getFormData;
  var setError;

  void dispose() {
    validate = null;
    getFormData = null;
    setError = null;
  }
}

class LogInForm extends StatefulWidget {
  final _LogInFormState _formState = _LogInFormState();
  final LoginController controller;
  LogInForm({
    @required this.controller,
  }) : assert(controller != null);
  @override
  _LogInFormState createState() => _formState;

  //validate emitter
  void validate() {
    emitter.emit('validate', this);
  }
}

class _LogInFormState extends State<LogInForm> {
  bool _isObscure = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String errorMessage = '';
  final _formKey = GlobalKey<FormState>();
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
            errorText: pass
                ? errorMessage?.isNotEmpty == true
                    ? errorMessage
                    : null
                : null,
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

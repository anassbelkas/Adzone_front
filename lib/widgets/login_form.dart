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
          buildInputForm('Your Email', 'Email', false, _emailController),
          buildInputForm(
              'Enter Password', 'Password', true, _passwordController),
        ],
      ),
    );
  }

  Padding buildInputForm(
      String hint, String label, bool pass, TextEditingController controller) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //label
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                label,
                style: TextStyle(fontSize: 14, color: kWhiteColor),
              ),
            ),
            TextFormField(
              obscureText: pass ? _isObscure : false,
              controller: controller,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  // floatingLabelBehavior: FloatingLabelBehavior.,
                  hintText: hint,
                  //drop shadow for input
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // label: Container(
                  //   padding: EdgeInsets.only(bottom: 40),
                  //   child: Text(
                  //     label,
                  //     style: TextStyle(fontSize: 18, color: kWhiteColor),
                  //   ),
                  // ),
                  hintStyle: TextStyle(color: Color(0xFF979797)),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(12.0),
                  //   borderSide: BorderSide(color: Colors.white),
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  errorText: pass
                      ? errorMessage?.isNotEmpty == true
                          ? errorMessage
                          : null
                      : null,
                  labelStyle: TextStyle(
                    color: kWhiteColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
          ],
        ));
  }
}

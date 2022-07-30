import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:spring/spring.dart';

class CheckBoxController {
  var validate;
  void dispose() {
    validate = null;
  }
}

class CheckBox extends StatefulWidget {
  final String text;
  CheckBoxController controller;
  CheckBox(
    this.text, {
    @required this.controller,
  }) : assert(controller != null);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _isSelected = false;
  Color _borderColor = kWhiteColor;
  final SpringController _springController =
      SpringController(initialAnim: Motion.pause);
  @override
  void initState() {
    super.initState();
    widget.controller.validate = () {
      if (_isSelected) {
        return true;
      } else {
        setState(() {
          _borderColor = kErrorColor;
        });
        _springController.play(motion: Motion.play);
        return false;
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isSelected = !_isSelected;
                  _borderColor = kWhiteColor;
                  _springController.play(motion: Motion.pause);
                });
              },
              child: Spring.shake(
                  springController: _springController,
                  animDuration: Duration(milliseconds: 500),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: _borderColor)),
                    child: _isSelected
                        ? Icon(
                            Icons.check,
                            size: 17,
                            color: kWhiteColor,
                          )
                        : null,
                  )),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              widget.text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kWhiteColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}

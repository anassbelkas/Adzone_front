import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';

class ReturnArrow extends StatelessWidget {
  //constructor
  const ReturnArrow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment(-1.0, -1.0),
          child: Transform.scale(
            scale: 2.0,
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                color: kWhiteColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment(-1.0, -1.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ))
      ],
    );
  }
}

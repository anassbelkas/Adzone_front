import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';

class ReturnArrow extends StatelessWidget {
  bool inverse;

  //constructor
  ReturnArrow({Key key, this.inverse = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
              top: -15,
              left: -15,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: inverse ? kWhiteColor : kPrimaryColor),
                width: 100,
                height: 100,
                child: TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        primary: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Icon(
                      IconData(0xe092,
                          fontFamily: 'MaterialIcons',
                          matchTextDirection: true),
                      color: inverse ? kPrimaryColor : kWhiteColor,
                    )),
              )),
        ],
      ),
    );
  }
}

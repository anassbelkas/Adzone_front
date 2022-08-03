import 'package:adzone/screens/notifications/components/notifications.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 85,
                    child: Stack(
                      children: [
                        Positioned(
                            top: -15,
                            left: -15,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Color(0xFFFA7850)),
                              width: 100,
                              height: 100,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      primary: Colors.white),
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Icon(IconData(0xe092,
                                      fontFamily: 'MaterialIcons',
                                      matchTextDirection: true))),
                            )),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      "Notifications",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Notifications(),
                ],
            ),
      ),
    );
  }
}
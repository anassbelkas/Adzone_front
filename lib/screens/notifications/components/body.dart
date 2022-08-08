import 'package:adzone/screens/notifications/components/notifications.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Body extends StatelessWidget {
  const Body({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 22.w,
                    child: Stack(
                      children: [
                        Positioned(
                            top: -8.h,
                            left: -4.w,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Color(0xFFFA7850)),
                              width: 25.w,
                              height: 25.h,
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
                      style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Notifications(),
                ],
            ),
      ),
    );
  }
}
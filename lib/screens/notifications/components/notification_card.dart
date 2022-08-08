import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key key,@required this.title, @required this.text, this.press,
  }) : super(key: key);

  
  final String title, text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
            child: FlatButton(
              padding: EdgeInsets.all(2.w),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Color.fromARGB(255, 255, 243, 240),
              onPressed: press,
              child: Row(
                children: [
                  Icon(
                    Icons.notification_important,
                    size: 30,
                    color: kPrimaryColor,
                  ),
                  SizedBox(width: 5.w),
                  Expanded(child: Column(
                    children: [
                      Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),),
                      SizedBox(height: 1.w,),
                      Text(text, style: TextStyle(fontSize: 10.sp), maxLines: 1,),
                    ],
                  )),
                  Icon(Icons.arrow_forward_ios, color: kPrimaryColor,),
                ],
              ),
            ),
          );
        }
      }

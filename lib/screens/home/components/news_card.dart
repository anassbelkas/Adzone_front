import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,@required this.title, @required this.text, @required this.icon, this.press,
  }) : super(key: key);

  
  final String title, text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
            child: FlatButton(
              padding: EdgeInsets.all(3.w),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              // color: kWhiteColor,
              onPressed: press,
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    width: 100,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(child: Column(
                    children: [
                      Text(title, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text(text, style: TextStyle(fontSize: 9.sp), maxLines: 3,),
                    ],
                  )),
                  Icon(Icons.arrow_forward_ios, color: kPrimaryColor,),
                ],
              ),
            ),
          );
        }
      }

import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key key,@required this.title, @required this.text, this.press,
  }) : super(key: key);

  
  final String title, text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
              padding: EdgeInsets.all(5),
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
                  SizedBox(width: 20),
                  Expanded(child: Column(
                    children: [
                      Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text(text, style: TextStyle(fontSize: 12), maxLines: 1,),
                    ],
                  )),
                  Icon(Icons.arrow_forward_ios, color: kPrimaryColor,),
                ],
              ),
            ),
          );
        }
      }

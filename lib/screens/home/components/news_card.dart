import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,@required this.title, @required this.text, @required this.icon, this.press,
  }) : super(key: key);

  
  final String title, text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Color.fromARGB(255, 255, 243, 240),
              onPressed: press,
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    width: 100,
                  ),
                  SizedBox(width: 20),
                  Expanded(child: Column(
                    children: [
                      Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text(text, style: TextStyle(fontSize: 12), maxLines: 3,),
                    ],
                  )),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          );
        }
      }

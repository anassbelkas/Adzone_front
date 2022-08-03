import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({ Key key }) : super(key: key);

  @override
  State<Settings> createState() => _SttingsState();
}

class _SttingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                "Settings",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FlatButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Color.fromARGB(255, 255, 243, 240),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: kPrimaryColor,
                        size: 30,
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Column(
                        children: [
                          Text("Login Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        ],
                      )),
                      Icon(Icons.arrow_forward_ios, color: kPrimaryColor,),
                    ],
                  ),
                ),
              ),
              Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: FlatButton(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Color.fromARGB(255, 255, 243, 240),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.auto_awesome_mosaic,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Expanded(child: Column(
                            children: [
                              Text("Support Center", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ],
                          )),
                          Icon(Icons.arrow_forward_ios, color: kPrimaryColor),
                        ],
                      ),
                    ),
              ),
              Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: FlatButton(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Color.fromARGB(255, 255, 243, 240),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.security,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Expanded(child: Column(
                            children: [
                              Text("Privacy and Security", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ],
                          )),
                          Icon(Icons.arrow_forward_ios, color: kPrimaryColor,),
                        ],
                      ),
                    ),
              ),
              Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: FlatButton(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Color.fromARGB(255, 255, 243, 240),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.language,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Expanded(child: Column(
                            children: [
                              Text("Language", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ],
                          )),
                          Icon(Icons.arrow_forward_ios, color: kPrimaryColor,),
                        ],
                      ),
                    ),
              ),
              Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: FlatButton(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Color.fromARGB(255, 255, 243, 240),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Expanded(child: Column(
                            children: [
                              Text("Notifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ],
                          )),
                          Icon(Icons.arrow_forward_ios, color: kPrimaryColor,),
                        ],
                      ),
                    ),
                ),
              ],
            ),
          ]
        )
      )
    );
  }
}
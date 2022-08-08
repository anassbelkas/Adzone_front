import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
                "Settings",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Column(
              children: [
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                child: FlatButton(
                  padding: EdgeInsets.all(5.w),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  // color: Color.fromARGB(255, 255, 243, 240),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: kPrimaryColor,
                        size: 30,
                      ),
                      SizedBox(width: 5.w),
                      Expanded(child: Column(
                        children: [
                          Text("Login Settings", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                        ],
                      )),
                      Icon(Icons.arrow_forward_ios, color: kPrimaryColor,),
                    ],
                  ),
                ),
              ),
              Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: FlatButton(
                      padding: EdgeInsets.all(5.w),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      // color: Color.fromARGB(255, 255, 243, 240),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.auto_awesome_mosaic,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                          SizedBox(width: 5.w),
                          Expanded(child: Column(
                            children: [
                              Text("Support Center", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                            ],
                          )),
                          Icon(Icons.arrow_forward_ios, color: kPrimaryColor),
                        ],
                      ),
                    ),
              ),
              Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: FlatButton(
                      padding: EdgeInsets.all(5.w),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      // color: Color.fromARGB(255, 255, 243, 240),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.security,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                          SizedBox(width: 5.w),
                          Expanded(child: Column(
                            children: [
                              Text("Privacy and Security", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                            ],
                          )),
                          Icon(Icons.arrow_forward_ios, color: kPrimaryColor,),
                        ],
                      ),
                    ),
              ),
              Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: FlatButton(
                      padding: EdgeInsets.all(5.w),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      // color: Color.fromARGB(255, 255, 243, 240),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.language,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                          SizedBox(width: 5.w),
                          Expanded(child: Column(
                            children: [
                              Text("Language", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                            ],
                          )),
                          Icon(Icons.arrow_forward_ios, color: kPrimaryColor,),
                        ],
                      ),
                    ),
              ),
              Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: FlatButton(
                      padding: EdgeInsets.all(5.w),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      // color: Color.fromARGB(255, 255, 243, 240),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                          SizedBox(width: 5.w),
                          Expanded(child: Column(
                            children: [
                              Text("Notifications", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
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
import 'package:adzone/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:sizer/sizer.dart';

class Achievements extends StatelessWidget {
  List<Map> achievements = [
    {
      'name': 'Collect 100 Posters',
      'iconPath': TablerIcons.medal,
      'iconColor': Colors.amber,
      'progression': '100',
      'goal': '100'
    },
    {
      'name': 'Buy 10 items from the shop',
      'iconPath': TablerIcons.medal,
      'iconColor': Colors.amber,
      'progression': '1',
      'goal': '10'
    },
    {
      'name': 'Travel a distance of 1000m',
      'iconPath': TablerIcons.medal,
      'iconColor': Color.fromARGB(255, 167, 98, 72),
      'progression': '50',
      'goal': '1000'
    },
    {
      'name': 'Use app for 7 days in a row',
      'iconPath': TablerIcons.medal,
      'iconColor': Color.fromARGB(255, 167, 98, 72),
      'progression': '1',
      'goal': '7'
    },
    {
      'name': 'Unlock all the posters in your area',
      'iconPath': TablerIcons.medal,
      'iconColor': Colors.amber,
      'progression': '20',
      'goal': '20'
    },
    {
      'name': 'Lorem ipsum',
      'iconPath': TablerIcons.medal,
      'iconColor': Color.fromARGB(255, 167, 98, 72),
      'progression': '1',
      'goal': '10'
    },
    {
      'name': 'Lorem ipsum',
      'iconPath': TablerIcons.medal,
      'iconColor': Colors.amber,
      'progression': '1',
      'goal': '10'
    },
    {
      'name': 'Lorem ipsum',
      'iconPath': TablerIcons.medal,
      'iconColor': Color.fromARGB(255, 167, 98, 72),
      'progression': '1',
      'goal': '10'
    },
    {
      'name': 'Lorem ipsum',
      'iconPath': TablerIcons.medal,
      'iconColor': Colors.grey,
      'progression': '1',
      'goal': '7'
    },
    {
      'name': 'Lorem ipsum',
      'iconPath': TablerIcons.medal,
      'iconColor': Color.fromARGB(255, 167, 98, 72),
      'progression': '1',
      'goal': '7'
    },
    {
      'name': 'Lorem ipsum',
      'iconPath': TablerIcons.medal,
      'iconColor': Colors.grey,
      'progression': '1',
      'goal': '7'
    },
    {
      'name': 'Lorem ipsum',
      'iconPath': TablerIcons.medal,
      'iconColor': Color.fromARGB(255, 167, 98, 72),
      'progression': '1',
      'goal': '7'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 15.h,
              child: Stack(
                children: [
                  Positioned(
                      top: -7.h,
                      left: -4.w,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kPrimaryColor),
                        width: 25.w,
                        height: 25.h,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                primary: kWhiteColor),
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
                "Achievements",
                style: TextStyle(fontSize: 5.h, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              height: 1.h,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: achievements.length,
                itemBuilder: ((context, index) {
                  return Container(
                      margin:
                          EdgeInsets.only(left: 3.w, right: 3.w, bottom: 0.5.h),
                      height: 7.h,
                      child: Stack(
                        children: [
                          Row(children: [
                            Icon(
                              achievements[index]['iconPath'],
                              color: achievements[index]['iconColor'],
                              size: 10.w,
                            ),
                            Text(
                              achievements[index]['name'],
                              style: TextStyle(fontSize: 2.2.h),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: 1.25.w),
                              padding: EdgeInsets.only(
                                  top: 0.4.h,
                                  bottom: 0.4.h,
                                  left: 2.w,
                                  right: 2.w),
                              decoration: BoxDecoration(
                                  color: achievements[index]['progression'] ==
                                          achievements[index]['goal']
                                      ? kPrimaryColor
                                      : kTextFieldColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.w))),
                              child: Text(
                                  achievements[index]['progression'] +
                                      '/' +
                                      achievements[index]['goal'],
                                  style: TextStyle(
                                      color: achievements[index]
                                                  ['progression'] ==
                                              achievements[index]['goal']
                                          ? kWhiteColor
                                          : kBlackColor)),
                            ),
                          ]),
                          achievements[index]['progression'] ==
                                  achievements[index]['goal']
                              ? Positioned(
                                  top: -0.3.h,
                                  right: -1.w,
                                  child: Icon(
                                      IconData(0xe156,
                                          fontFamily: 'MaterialIcons'),
                                      color: kGreenColor))
                              : Container(),
                        ],
                      ));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:adzone/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

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
                "Achievements",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: achievements.length,
                itemBuilder: ((context, index) {
                  return Container(
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 3),
                      height: 50,
                      child: Stack(
                        children: [
                          Row(children: [
                            Icon(
                              achievements[index]['iconPath'],
                              color: achievements[index]['iconColor'],
                              size: 40,
                            ),
                            Text(
                              achievements[index]['name'],
                              style: TextStyle(fontSize: 15),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              padding: EdgeInsets.only(
                                  top: 3, bottom: 3, left: 8, right: 8),
                              decoration: BoxDecoration(
                                  color: achievements[index]['progression'] ==
                                          achievements[index]['goal']
                                      ? Color(0xFFFA7850)
                                      : Color.fromARGB(255, 200, 200, 200),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Text(
                                  achievements[index]['progression'] +
                                      '/' +
                                      achievements[index]['goal'],
                                  style: TextStyle(
                                      color: achievements[index]
                                                  ['progression'] ==
                                              achievements[index]['goal']
                                          ? Colors.white
                                          : Colors.black)),
                            ),
                          ]),
                          achievements[index]['progression'] ==
                                  achievements[index]['goal']
                              ? Positioned(
                                  top: -2,
                                  right: -4,
                                  child: Icon(
                                      IconData(0xe156,
                                          fontFamily: 'MaterialIcons'),
                                      color: Color.fromARGB(255, 6, 202, 13)))
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

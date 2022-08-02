import 'package:adzone/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class Rewards extends StatefulWidget {
  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  int selectedButton = 0;

  int changeButton(int index) {
    selectedButton = index;
    return selectedButton;
  }

  List<Map> claimedRewards = [
    {
      'name': 'Mcdo Free Mac burger',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'iconPath': IconData(0xee3c, fontFamily: 'MaterialIcons'),
      'points': '25000'
    },
    {
      'name': 'Cominos 50% coupon',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'iconPath': IconData(0xee3c, fontFamily: 'MaterialIcons'),
      'points': '30000'
    },
    {
      'name': '10% Playstation Card',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'iconPath': IconData(0xee3c, fontFamily: 'MaterialIcons'),
      'points': '50000'
    },
    {
      'name': '100 Dh Orange',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'iconPath': IconData(0xee3c, fontFamily: 'MaterialIcons'),
      'points': '60000'
    },
  ];

  List<Map> categories = [
    {'name': 'All', 'iconPath': IconData(0xee3c, fontFamily: 'MaterialIcons')},
    {
      'name': 'Gaming',
      'iconPath': IconData(0xe6aa, fontFamily: 'MaterialIcons')
    },
    {'name': 'Food', 'iconPath': IconData(0xe25a, fontFamily: 'MaterialIcons')},
    {
      'name': 'Electronics',
      'iconPath': IconData(0xe367, fontFamily: 'MaterialIcons')
    },
    {'name': 'More', 'iconPath': IconData(0xe402, fontFamily: 'MaterialIcons')},
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
                "Claimed Rewards",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              child: Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                changeButton(index);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              side: BorderSide(
                                  width: 1,
                                  color: selectedButton == index
                                      ? Color(0xFFFA7850)
                                      : Color.fromARGB(255, 200, 200, 200)),
                              primary: selectedButton == index
                                  ? Color(0xFFFA7850)
                                  : Colors.white,
                            ),
                            child: Row(children: [
                              Icon(
                                categories[index]['iconPath'],
                                color: selectedButton == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                categories[index]['name'],
                                style: TextStyle(
                                    color: selectedButton == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 18),
                              )
                            ]),
                          )
                        ],
                      ));
                    }),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: claimedRewards.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 3),
                    padding: EdgeInsets.all(12),
                    height: 150,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ],
                        color: Color(0xFFFAF7F2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(children: [
                      Container(
                        width: 120,
                        height: 120,
                        child: Image(image: AssetImage("images/_home.png")),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(claimedRewards[index]['name'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Flexible(
                              child: Text(claimedRewards[index]['description'],
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100,
                                      color: Color(0xFF5B5B5B))),
                            ),
                            Container(
                              child: Row(children: [
                                Text(
                                    claimedRewards[index]['points'] + ' Points',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color:
                                            Color.fromARGB(255, 48, 136, 51))),
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      primary: Color(0xFFFA7850)),
                                  child: Text(
                                    'View',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )
                              ]),
                            )
                          ],
                        ),
                      )
                    ]),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

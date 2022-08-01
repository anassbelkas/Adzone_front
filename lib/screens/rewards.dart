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
      ///appBar: AppBar(
      ///title: Text('Completed Rewards'),
      ///backgroundColor: Color(0xFFFA7850),
      ///),
      body: SingleChildScrollView(
          child: Column(children: [
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
        Container(
          height: 45,
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
                        primary: selectedButton == index
                            ? Color(0xFFFA7850)
                            : Color(0xFFA8A8A8),
                      ),
                      child: Row(children: [
                        Icon(
                          categories[index]['iconPath'],
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          categories[index]['name'],
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ]),
                    )
                  ],
                ));
              }),
        ),
      ])),
    );
  }
}

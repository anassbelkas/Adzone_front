import 'package:adzone/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

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
                "Claimed Rewards",
                style: TextStyle(fontSize: 5.h, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            SingleChildScrollView(
              child: Container(
                height: 7.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Row(
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                changeButton(index);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.all(3.w),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.w),
                              ),
                              side: BorderSide(
                                  width: 0.25.w,
                                  color: selectedButton == index
                                      ? kPrimaryColor
                                      : kTextFieldColor),
                              primary: selectedButton == index
                                  ? kPrimaryColor
                                  : kWhiteColor,
                            ),
                            child: Row(children: [
                              Icon(
                                categories[index]['iconPath'],
                                color: selectedButton == index
                                    ? kWhiteColor
                                    : kBlackColor,
                              ),
                              SizedBox(
                                width: 2.5.w,
                              ),
                              Text(
                                categories[index]['name'],
                                style: TextStyle(
                                    color: selectedButton == index
                                        ? kWhiteColor
                                        : kBlackColor,
                                    fontSize: 2.5.h),
                              )
                            ]),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                        ],
                      ));
                    }),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: claimedRewards.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin:
                        EdgeInsets.only(left: 3.w, right: 3.w, bottom: 0.5.h),
                    padding: EdgeInsets.all(3.w),
                    height: 22.h,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: kGreyColor.withOpacity(0.5),
                            spreadRadius: 0.5.w,
                            blurRadius: 1.25.w,
                          )
                        ],
                        color: kadzone,
                        borderRadius: BorderRadius.all(Radius.circular(5.w))),
                    child: Row(children: [
                      Container(
                        width: 30.w,
                        child: Image(image: AssetImage("images/_home.png")),
                      ),
                      SizedBox(
                        width: 2.5.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(claimedRewards[index]['name'],
                                style: TextStyle(
                                    fontSize: 3.h,
                                    fontWeight: FontWeight.bold)),
                            Flexible(
                              child: Text(claimedRewards[index]['description'],
                                  style: TextStyle(
                                      fontSize: 1.8.h,
                                      fontWeight: FontWeight.w100,
                                      color: kZambeziColor)),
                            ),
                            Container(
                              child: Row(children: [
                                Text(
                                    claimedRewards[index]['points'] + ' Points',
                                    style: TextStyle(
                                        fontSize: 2.5.h,
                                        fontWeight: FontWeight.w300,
                                        color: kGreenColor)),
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      padding: EdgeInsets.only(
                                          left: 5.w, right: 5.w),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.5.w),
                                      ),
                                      primary: kPrimaryColor),
                                  child: Text(
                                    'View',
                                    style: TextStyle(fontSize: 2.5.h),
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

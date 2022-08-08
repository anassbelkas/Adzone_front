import 'package:adzone/models/product.dart';
import 'package:adzone/screens/details/details_screen.dart';
import 'package:adzone/screens/home/components/product_card.dart';
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ViewAllRewards extends StatelessWidget {
  const ViewAllRewards({ Key key }) : super(key: key);

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
                "Rewards",
                style: TextStyle(fontSize: 5.h, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
          ]
        )
      )
    );
  }
}
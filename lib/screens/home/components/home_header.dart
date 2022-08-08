import 'package:adzone/screens/home/components/icon_btn_with_counter.dart';
import 'package:adzone/screens/home/components/search_field.dart';
import 'package:adzone/screens/notifications/notification_screen.dart';
import 'package:adzone/size_config.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            numOfItems: 3,
            press: () => Navigator.push( context, MaterialPageRoute( builder: (context) => Notifications()),),
          )
        ],
      ),
    );
  }
}

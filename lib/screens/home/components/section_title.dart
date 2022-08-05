import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,@required this.text,@required this.press,
  }) : super(key: key);

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              color: kGreyColor,
              fontWeight: FontWeight.bold
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              "View all",
              style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
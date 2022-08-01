import 'package:adzone/size_config.dart';
import 'package:adzone/widgets/rounded_icon_btn.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            RoundedIconBtn(iconData: Icons.arrow_back_ios_new, press: () => Navigator.pop(context))
          ],
        ),
      ),
    );
  }
}
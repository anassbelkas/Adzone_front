import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

class SurpriseBanner extends StatelessWidget {
  const SurpriseBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
        ),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text.rich(
        TextSpan(
          text: "A Summer Surprise\n",
          style: TextStyle(color: kWhiteColor),
          children: [
            TextSpan(
              text: "More Points to claim...",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )
            )
          ],
        )
      ),
    );
  }
}

import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key key,
    this.numOfItems = 0,
    @required this.press,
  }) : super(key: key);

  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              height: getProportionateScreenWidth(46),
              width: getProportionateScreenWidth(46),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.notifications)),
          if (numOfItems != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: getProportionateScreenHeight(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfItems",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

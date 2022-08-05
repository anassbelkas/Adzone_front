
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.75, //60% of our width
      // height: 50,
      decoration: BoxDecoration(
        color: kGreyColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
        child: TextField(
          onChanged: (value) {
            //search value
          },
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Search Reward",
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(9),
              )
          ),
        ),
    );
  }
}

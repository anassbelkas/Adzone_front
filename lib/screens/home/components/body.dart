import 'package:adzone/screens/home/components/categories.dart';
import 'package:adzone/screens/home/components/news.dart';
import 'package:adzone/screens/home/components/popular_products.dart';
import 'package:adzone/screens/home/components/popular_rewards.dart';
import 'package:adzone/screens/home/components/surprise_banner.dart';
import 'package:adzone/screens/home/components/home_header.dart';
import 'package:adzone/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20),),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(30),),
            SurpriseBanner(),
            SizedBox(height: getProportionateScreenWidth(30),),
            Categories(),
            // SizedBox(height: getProportionateScreenWidth(30),),
            // PopularRewards(),
            SizedBox(height: getProportionateScreenWidth(30),),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30),),
            News(),
            SizedBox(height: getProportionateScreenWidth(30),),
          ],
        ),
      ),
    );
  }
}


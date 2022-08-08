import 'package:adzone/screens/home/components/categories.dart';
import 'package:adzone/screens/home/components/news.dart';
import 'package:adzone/screens/home/components/popular_products.dart';
import 'package:adzone/screens/home/components/home_header.dart';
import 'package:adzone/size_config.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5.w,),
            HomeHeader(),
            SizedBox(height: 5.w,),
            PopularProducts(),
            SizedBox(height: 6.w,),
            Categories(),
            SizedBox(height: 6.w,),
            News(),
            SizedBox(height: 5.w,),
          ],
        ),
      ),
    );
  }
}


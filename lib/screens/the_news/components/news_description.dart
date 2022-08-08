import 'package:adzone/models/news.dart';
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewsDescription extends StatelessWidget {
  const NewsDescription({
    Key key,
    @required this.news,
  }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
          child: Text(news.title, style: Theme.of(context).textTheme.headline6, maxLines: 2,), 
        ),
         SizedBox(height: 2.h,),
        
        Padding(
          padding: EdgeInsets.only(
            left: 6.w,
            right: 6.w,
            bottom: 3.h
          ),
          child: Text(
            news.description,
          ),
        ),
      ],
    );
  }
}

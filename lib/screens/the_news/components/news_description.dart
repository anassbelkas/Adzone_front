import 'package:adzone/models/news.dart';
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

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
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenWidth(10)),
          child: Text(news.title, style: Theme.of(context).textTheme.headline6, maxLines: 2,), 
        ),
        const SizedBox(height: 5,),
        
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
            bottom: getProportionateScreenWidth(200)
          ),
          child: Text(
            news.description,
          ),
        ),
      ],
    );
  }
}

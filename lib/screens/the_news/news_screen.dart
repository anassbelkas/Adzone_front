import 'package:adzone/models/news.dart';
import 'package:adzone/screens/the_news/components/body.dart';
import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';

class NewsScreen extends StatelessWidget {
  static String routeName = "/news";

  @override
  Widget build(BuildContext context) {
    final NewsArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Body(news: arguments.news,),
    );
  }
}

class NewsArguments {
  final News news;

  NewsArguments({@required this.news});
  
}
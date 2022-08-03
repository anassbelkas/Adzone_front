import 'package:adzone/screens/details/details_screen.dart';
import 'package:adzone/screens/the_news/news_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes ={
  DetailsScreen.routeName: (context) => DetailsScreen(),
  NewsScreen.routeName: (context) => NewsScreen(),
};
import 'package:adzone/models/product.dart';
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
      body: Body(product: arguments.product,),
    );
  }
}

class NewsArguments {
  final Product product;

  NewsArguments({@required this.product});
  
}
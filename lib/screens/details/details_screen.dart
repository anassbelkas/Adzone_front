import 'package:adzone/models/product.dart';
import 'package:adzone/screens/details/components/custom_app_bar.dart';
import 'package:adzone/screens/details/components/body.dart';
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: CustomAppBar(),
      body: Body(product: arguments.product,),
    );
  }
}



class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
  
}
import 'package:adzone/models/product.dart';
import 'package:adzone/screens/home/components/product_card.dart';
import 'package:adzone/screens/home/components/section_title.dart';
import 'package:adzone/size_config.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(text: "Popular Rewards", press: () {}),
        SizedBox(height: getProportionateScreenWidth(20),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length, 
                (index) => ProductCard(
                  product: demoProducts[index],
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(20),),
            ],
          ),
        ),
      ],
    );
  }
}

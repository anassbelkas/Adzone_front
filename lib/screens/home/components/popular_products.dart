import 'package:adzone/models/product.dart';
import 'package:adzone/screens/details/details_screen.dart';
import 'package:adzone/screens/home/components/product_card.dart';
import 'package:adzone/screens/home/components/section_title.dart';
import 'package:adzone/screens/view_all_rewards.dart';
import 'package:adzone/size_config.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(text: "Popular Rewards", press: () {Navigator.push(context,MaterialPageRoute(builder: (context) => ViewAllRewards()),);}),
        SizedBox(height: 5.w,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length, 
                (index) {
                  if (demoProducts[index].isPopular)
                    return ProductCard(
                      product: demoProducts[index],
                      press: () => {Navigator.pushNamed(context, DetailsScreen.routeName, arguments: ProductDetailsArguments(product: demoProducts[index]),)},
                    );
                  
                  return SizedBox
                      .shrink();  //by default width and height = 0
                },
              ),
              SizedBox(height: getProportionateScreenWidth(20),),
            ],
          ),
        ),
      ],
    );
  }
}

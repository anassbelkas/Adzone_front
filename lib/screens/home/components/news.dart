import 'package:adzone/models/product.dart';
import 'package:adzone/screens/home/components/news_card.dart';
import 'package:adzone/screens/home/components/section_title.dart';
import 'package:adzone/screens/the_news/news_screen.dart';
import 'package:adzone/size_config.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(text: "News", press: () {}),
        SizedBox(height: getProportionateScreenWidth(20),),
              ...List.generate(
                demoProducts.length, 
                (index) {
                   return NewsCard(
                    title: demoProducts[index].title,
                    text: demoProducts[index].description,
                    icon: demoProducts[index].images[0],
                    // press: () => {Navigator.pushNamed(context, DetailsScreen.routeName, arguments: ProductDetailsArguments(product: demoProducts[index]),)},
                    press: () => {Navigator.push(context, MaterialPageRoute( builder: (context) => NewsScreen()))}
                    );
                },
              ),
        SizedBox(height: getProportionateScreenWidth(20),),
      ],
    );
  }
}

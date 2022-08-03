import 'package:adzone/models/news.dart';
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
                demoNews.length, 
                (index) {
                   return NewsCard(
                    title: demoNews[index].title,
                    text: demoNews[index].description,
                    icon: demoNews[index].images[0],
                    press: () => {Navigator.pushNamed(context, NewsScreen.routeName, arguments: NewsArguments(news: demoNews[index]),)},
                    // press: () => {Navigator.push(context, MaterialPageRoute( builder: (context) => NewsScreen()))}
                    );
                },
              ),
        SizedBox(height: getProportionateScreenWidth(20),),
      ],
    );
  }
}

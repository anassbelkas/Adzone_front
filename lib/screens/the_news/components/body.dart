import 'package:adzone/models/news.dart';
import 'package:adzone/screens/the_news/components/news_description.dart';
import 'package:adzone/screens/the_news/components/news_image.dart';
import 'package:adzone/widgets/top_rounded_container.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({ Key key,@required this.news }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                  height: 85,
                  child: Stack(
                    children: [
                      Positioned(
                          top: -15,
                          left: -15,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Color(0xFFFA7850)),
                            width: 100,
                            height: 100,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    primary: Colors.white),
                                onPressed: () => Navigator.of(context).pop(),
                                child: Icon(IconData(0xe092,
                                    fontFamily: 'MaterialIcons',
                                    matchTextDirection: true))),
                          )),
                    ],
                  ),
                ),
            NewsImage(news: news),
            TopRoundedContainer(
              color: Color.fromARGB(255, 255, 251, 250),
              child: NewsDescription(
                news: news,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
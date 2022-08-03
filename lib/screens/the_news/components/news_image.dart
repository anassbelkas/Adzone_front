import 'package:adzone/models/news.dart';
import 'package:adzone/size_config.dart';
import 'package:flutter/material.dart';

class NewsImage extends StatelessWidget {
  final int selectedimage = 0;
  const NewsImage({
    Key key,
    @required this.news,
  }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(300),
          child: AspectRatio(aspectRatio: 1, child: Image.asset(news.images[selectedimage]),),
        ),
        Row()
      ],
    );
  }
}
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';


class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories =[
      {"icon": Icon(Icons.flash_on), "text": "Flash Deal"},
      {"icon": Icon(Icons.data_exploration), "text": "Data"},
      {"icon": Icon(Icons.videogame_asset), "text": "Gaming"},
      {"icon": Icon(Icons.fastfood), "text": "Food"},
      {"icon": Icon(Icons.more_horiz), "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categories[index]["icon"], 
              text: categories[index]["text"], 
              press: () {},
            )
          )
        ],
      ),
    );
  }
}



class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,@required this.icon,@required this.text,@required this.press,
  }) : super(key: key);

final Icon icon;
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                  color: kadzone2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: icon,
              ),
            ),
            const SizedBox(height: 15,),
            Text(text, textAlign: TextAlign.center, style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
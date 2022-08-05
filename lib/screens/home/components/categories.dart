import 'package:adzone/screens/home/components/section_title.dart';
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';


class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories =[
      {"icon": Icon(Icons.data_exploration, color: Colors.blue.shade900,), "text": "Data", "color": Colors.blue.shade100},
      {"icon": Icon(Icons.videogame_asset, color: Colors.green.shade900,), "text": "Gaming", "color": Colors.green.shade100},
      {"icon": Icon(Icons.fastfood, color: Colors.amber.shade900,), "text": "Food", "color": Colors.amber.shade100},
      {"icon": Icon(Icons.more_horiz, color: Colors.purple.shade900,), "text": "More", "color": Colors.purple.shade100},
    ];
    return Column(
      children: [
        SectionTitle(text: "Reward Categories", press: () {}),
        SizedBox(height: getProportionateScreenWidth(20),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    categories.length,
                    (index) => CategoryCard(
                      icon: categories[index]["icon"], 
                      text: categories[index]["text"], 
                      color: categories[index]["color"], 
                      press: () {},
                    )
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}



class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,@required this.icon,@required this.text,@required this.press, @required this.color,
  }) : super(key: key);

final Icon icon;
  final String text;
  final GestureTapCallback press;
  final Color color;

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
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: icon,
              ),
            ),
            const SizedBox(height: 6,),
            Text(text, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
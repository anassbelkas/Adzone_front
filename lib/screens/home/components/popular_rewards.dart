import 'package:adzone/screens/home/components/section_title.dart';
import 'package:adzone/size_config.dart';
import 'package:adzone/theme.dart';
import 'package:flutter/material.dart';

class PopularRewards extends StatelessWidget {
  const PopularRewards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Rewards",
          press: () {},
        ),
        SizedBox(height: getProportionateScreenWidth(20),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              RewardCard(
                image: "images/019.png",
                category: "Watch",
                numOfPoints: 100,
                press: () {},
              ),
              RewardCard(
                image: "images/_home.png",
                category: "Home",
                numOfPoints: 100,
                press: () {},
              ),
              RewardCard(
                image: "images/istore.png",
                category: "Food",
                numOfPoints: 100,
                press: () {},
              ),
              RewardCard(
                image: "images/kfc.png",
                category: "Food",
                numOfPoints: 100,
                press: () {},
              ),
              RewardCard(
                image: "images/woolworths.png",
                category: "Food",
                numOfPoints: 100,
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20),),
            ],
          ),
        ),
      ],
    );
  }
}

class RewardCard extends StatelessWidget {
  const RewardCard({
    Key key,@required this.category,@required this.image,@required this.numOfPoints,@required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfPoints;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(140),
        height: getProportionateScreenWidth(90),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF343434).withOpacity(0.4),
                      Color(0xFF343434).withOpacity(0.15),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15), vertical: getProportionateScreenWidth(10),),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: kWhiteColor),
                    children: [
                      TextSpan(
                        text: "$category\n", 
                        style: TextStyle(fontSize: getProportionateScreenWidth(18), fontWeight: FontWeight.bold,)
                      ),
                      TextSpan(
                        text: "$numOfPoints points",
                        style: TextStyle(fontWeight: FontWeight.bold,)
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


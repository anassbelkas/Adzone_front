import 'package:adzone/models/product.dart';
import 'package:adzone/screens/notifications/components/notification_card.dart';
import 'package:adzone/size_config.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenWidth(20),),
              ...List.generate(
                demoProducts.length, 
                (index) {
                   return NotificationCard(
                    title: demoProducts[index].title,
                    text: demoProducts[index].description,
                    press: () {},
                    // press: () => {Navigator.pushNamed(context, NewsScreen.routeName, arguments: NewsArguments(product: demoProducts[index]),)},
                    );
                },
              ),
        SizedBox(height: getProportionateScreenWidth(20),),
      ],
    );
  }
}

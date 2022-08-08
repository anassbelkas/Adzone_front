import 'package:adzone/models/notification.dart';
import 'package:adzone/screens/notifications/components/notification_card.dart';
import 'package:adzone/size_config.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Notifications extends StatelessWidget {
  const Notifications({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: (5.w),),
              ...List.generate(
                demoNotification.length, 
                (index) {
                   return NotificationCard(
                    title: demoNotification[index].title,
                    text: demoNotification[index].description,
                    press: () {},
                    // press: () => {Navigator.pushNamed(context, NewsScreen.routeName, arguments: NewsArguments(product: demoProducts[index]),)},
                    );
                },
              ),
        SizedBox(height: 5.w,),
      ],
    );
  }
}

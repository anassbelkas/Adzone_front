import 'package:adzone/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';

class Rewards extends StatelessWidget {
  List<Map> categories = [
    {'name': 'All', 'iconPath': IconData(0xee3c, fontFamily: 'MaterialIcons')},
    {
      'name': 'Gaming',
      'iconPath': IconData(0xe6aa, fontFamily: 'MaterialIcons')
    },
    {'name': 'Food', 'iconPath': IconData(0xe25a, fontFamily: 'MaterialIcons')},
    {
      'name': 'Electronics',
      'iconPath': IconData(0xe367, fontFamily: 'MaterialIcons')
    },
    {'name': 'More', 'iconPath': IconData(0xe402, fontFamily: 'MaterialIcons')},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Completed Rewards'),
          backgroundColor: Colors.amber[600],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 25,
            ),
            Container(
              height: 45,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(children: [
                            Icon(
                              categories[index]['iconPath'],
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              categories[index]['name'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ]),
                        )
                      ],
                    ));
                  }),
            ),
          ]),
        ));
  }
}

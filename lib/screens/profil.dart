import 'package:adzone/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                "Profile",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.amber[600]),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(10, 10))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://picsum.photos/250?image=9"))),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.amber[600], shape: BoxShape.circle),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text("First name",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
            Text("Last name",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
            SizedBox(height: 10),
            Container(
              child: Text("Joined time ago"),
              padding: EdgeInsets.only(left: 25),
            ),
            SizedBox(height: 10),
            Container(
                decoration: BoxDecoration(
                    color: Colors.amber[600],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(children: <Widget>[
                  Icon(IconData(0xe595, fontFamily: 'MaterialIcons')),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Saved Locations',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          primary: Colors.black),
                      onPressed: () {},
                      child: Icon(IconData(0xe09c,
                          fontFamily: 'MaterialIcons',
                          matchTextDirection: true)))
                ]),
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(12)),
            Container(
                decoration: BoxDecoration(
                    color: Colors.amber[600],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(children: <Widget>[
                  Icon(IconData(0xf7c4, fontFamily: 'MaterialIcons')),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Claimed Rewards',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          primary: Colors.black),
                      onPressed: () {},
                      child: Icon(IconData(0xe09c,
                          fontFamily: 'MaterialIcons',
                          matchTextDirection: true)))
                ]),
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(12)),
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber[600],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(children: <Widget>[
                Icon(IconData(0xeff0, fontFamily: 'MaterialIcons')),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Achievements',
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: Colors.black,
                    ),
                    onPressed: () {},
                    child: Icon(IconData(0xe09c,
                        fontFamily: 'MaterialIcons', matchTextDirection: true)))
              ]),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(12),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.amber[600],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(children: <Widget>[
                  Icon(IconData(0xe57f, fontFamily: 'MaterialIcons')),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          primary: Colors.black),
                      onPressed: () {},
                      child: Icon(IconData(0xe09c,
                          fontFamily: 'MaterialIcons',
                          matchTextDirection: true)))
                ]),
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(12)),
            Container(
                decoration: BoxDecoration(
                    color: Colors.amber[600],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(children: <Widget>[
                  Icon(IconData(0xf695, fontFamily: 'MaterialIcons')),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Delete Account',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          primary: Colors.black),
                      onPressed: () {},
                      child: Icon(IconData(0xe09c,
                          fontFamily: 'MaterialIcons',
                          matchTextDirection: true)))
                ]),
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(12)),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber[600], width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Color.fromARGB(255, 211, 159, 39)),
                onPressed: () {},
                child: Text(
                  "Sign out",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

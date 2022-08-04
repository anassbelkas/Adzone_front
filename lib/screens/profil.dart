import 'package:adzone/models/user.dart';
import 'package:adzone/providers/profile.dart';
import 'package:adzone/screens/Settings.dart';
import 'package:adzone/screens/home.dart';
import 'package:adzone/screens/rewards.dart';
import 'package:adzone/screens/achievements.dart';
import 'package:adzone/utils/constants.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class Profil extends StatelessWidget {
  PrimaryButton _primaryButton = PrimaryButton(
    buttonText: 'Sign Out',
    borderColor: kPrimaryColor,
    height: 7.h,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AvatarHead(),
                  SizedBox(height: 10),
                  Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFA7850),
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
                          color: Color(0xFFFA7850),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Rewards()),
                              );
                            },
                            child: Icon(IconData(0xe09c,
                                fontFamily: 'MaterialIcons',
                                matchTextDirection: true)))
                      ]),
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(12)),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFA7850),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Achievements()),
                            );
                          },
                          child: Icon(IconData(0xe09c,
                              fontFamily: 'MaterialIcons',
                              matchTextDirection: true)))
                    ]),
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFA7850),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Settings()),
                              );
                            },
                            child: Icon(IconData(0xe09c,
                                fontFamily: 'MaterialIcons',
                                matchTextDirection: true)))
                      ]),
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(12)),
                  Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFA7850),
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
                  _primaryButton
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarHead extends StatefulWidget {
  @override
  _AvatarHeadState createState() => _AvatarHeadState();
}

class _AvatarHeadState extends State<AvatarHead> {
  ProfileApi profileApi = ProfileApi();
  var image = NetworkImage(SERVER_URL + '/placeholders/user_image.jpg');
  int daysSinceJoined = 0;
  User user;
  @override
  void initState() {
    super.initState();
    profileApi.getUser().then((value) {
      setState(() {
        // print(value.email);
        image = NetworkImage(SERVER_URL + '/images/' + value.image);
        //calculate number of days since when user joined
        var date = DateTime.parse(value.created_at);
        var difference = DateTime.now().difference(date);
        daysSinceJoined = difference.inDays;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () => null,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              // spreadRadius: 2,
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, 5))
                        ],
                        shape: BoxShape.circle,
                        image:
                            DecorationImage(fit: BoxFit.cover, image: image)),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              // spreadRadius: 2,
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, 5))
                        ], color: kWhiteColor, shape: BoxShape.circle),
                        child: Icon(
                          Iconsax.user_edit,
                          color: kGreyColor,
                        ),
                      ))
                ],
              ),
            )),
        SizedBox(
          height: 3.h,
        ),
        Text(user?.first_name ?? 'Jack',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
        Text(user?.last_name ?? 'Sparow',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
        SizedBox(height: 10),
        Container(
          child: Text('Joined $daysSinceJoined days ago',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
        )
      ],
    );
  }
}

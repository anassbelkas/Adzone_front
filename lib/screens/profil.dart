import 'dart:io';

import 'package:adzone/models/user.dart';
import 'package:adzone/providers/authentication.dart';
import 'package:adzone/providers/profile.dart';
import 'package:adzone/screens/Settings.dart';
import 'package:adzone/screens/home.dart';
import 'package:adzone/screens/login.dart';
import 'package:adzone/screens/rewards.dart';
import 'package:adzone/screens/achievements.dart';
import 'package:adzone/utils/constants.dart';
import 'package:adzone/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class Profil extends StatelessWidget {
  AuthenticationApi _authenticationApi = AuthenticationApi();
  PrimaryButton _primaryButton = PrimaryButton(
    buttonText: 'Sign Out',
    borderColor: kPrimaryColor,
    height: 7.h,
  );

  GestureDetector profileLinks(BuildContext context, String text, IconData icon,
      {Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: Row(children: <Widget>[
            Icon(
              icon,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16, color: kPurpleColor),
            ),
            Spacer(),
            Icon(Iconsax.arrow_right_3, color: kPrimaryColor),
          ]),
          // margin: const EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.9.h)),
    );
  }

  @override
  Widget build(BuildContext context) {
    _primaryButton.onPressed = () {
      _authenticationApi.logout().then((value) {
        if (value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LogInScreen(),
            ),
          );
        }
      });
    };
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AvatarHead(),
                  SizedBox(height: 1.h),
                  profileLinks(context, 'Saved Locations', Iconsax.location,
                      onTap: () {}),
                  profileLinks(context, 'Claimed Rewards',
                      IconData(0xf7c4, fontFamily: 'MaterialIcons'), onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Rewards()),
                    );
                  }),
                  profileLinks(
                      context, 'Achievements', Iconsax.notification_status,
                      onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Achievements()),
                    );
                  }),
                  profileLinks(context, 'Settings', Iconsax.settings,
                      onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  }),
                  profileLinks(context, 'Delete Account', Iconsax.trash,
                      onTap: () {}),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 3.w,
                right: 3.w,
                top: 1.h,
              ),
              child: _primaryButton,
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
  NetworkImage image =
      NetworkImage(SERVER_URL + '/placeholders/user_image.jpg');
  int daysSinceJoined = 0;
  String firstName = 'Jack';
  String lastName = 'Sparow';
  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    profileApi.getUser().then((value) {
      if (value != null) {
        setState(() {
          firstName = value.first_name ?? 'Jack';
          lastName = value.last_name ?? 'Sparow';
          value.image != null
              ? image = NetworkImage(SERVER_URL + '/images/' + value.image)
              : image = const NetworkImage(
                  SERVER_URL + '/placeholders/user_image.jpg');
          var date = DateTime.parse(value.created_at);
          var difference = DateTime.now().difference(date);
          daysSinceJoined = difference.inDays;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              _picker.pickImage(source: ImageSource.gallery).then((value) {
                if (value != null) {
                  profileApi.updateAvatar(File(value.path)).then((value) {
                    if (value != null) {
                      setState(() {
                        image =
                            NetworkImage(SERVER_URL + '/images/' + value.image);
                      });
                    }
                  });
                }
              });
            },
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
        Text(firstName,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
        Text(lastName,
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

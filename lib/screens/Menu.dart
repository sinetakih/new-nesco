// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';
import 'package:nesco/screens/widgets/menu_items.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      kPrimaryColor.withOpacity(.2),
                      kPrimaryColor.withOpacity(.1),
                    ]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Hi, Danny!',
                  style: TextStyle(
                    fontFamily: 'Lato-Bold',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21, vertical: 26),
              child: Column(
                children: [
                  MenuItems(
                    text: 'Contact Details',
                    icon: CupertinoIcons.person_alt_circle_fill,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  MenuItems(
                      text: 'My account manager',
                      icon: CupertinoIcons.person_badge_plus_fill),
                  SizedBox(
                    height: 17,
                  ),
                  MenuItems(
                    text: 'Payment',
                    icon: CupertinoIcons.creditcard_fill,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  MenuItems(
                    text: 'Change Password',
                    icon: CupertinoIcons.lock_shield_fill,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  MenuItems(
                    text: 'Service History',
                    icon: CupertinoIcons.arrow_uturn_right_circle,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  MenuItems(
                    text: 'Contact Us',
                    icon: CupertinoIcons.phone_circle_fill,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  MenuItems(
                    text: 'Support',
                    icon: CupertinoIcons.headphones,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  MenuItems(
                    text: 'Terms & Conditions',
                    icon: CupertinoIcons.link_circle_fill,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  MenuItems(
                      text: 'Privacy Policy',
                      icon: CupertinoIcons.link_circle_fill),
                  SizedBox(
                    height: 17,
                  ),
                  MenuItems(
                    text: 'Delete Account',
                    icon: CupertinoIcons.person_crop_circle_fill_badge_xmark,
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  MenuItems(
                    text: 'Log Out',
                    icon: CupertinoIcons.power,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import 'Menu.dart';
import 'checklist.dart';
import 'garage.dart';
import 'homescreen.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int currentIndex = 0;

  void goToPage(index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> _pages = [
    HomeScreen(),
    ChecklistPage(),
    Garage(),
    MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: GNav(
              backgroundColor: Colors.white,
              tabBackgroundColor: kPrimaryColor.withOpacity(.2),
              padding: EdgeInsets.all(16),
              activeColor: kPrimaryColor,
              gap: 8,
              onTabChange: (index) => goToPage(index),
              tabs: [
                GButton(
                  icon: CupertinoIcons.house,
                  text: 'Home',
                ),
                GButton(
                  icon: CupertinoIcons.square_list,
                  text: 'Checklist',
                ),
                GButton(
                  icon: CupertinoIcons.car_detailed,
                  text: 'Garage',
                ),
                GButton(
                  icon: CupertinoIcons.bars,
                  text: 'Menu',
                )
              ]),
        ),
      ),
    );
  }
}

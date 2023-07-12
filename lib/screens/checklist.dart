// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesco/screens/widgets/activity_notificator.dart';

class ChecklistPage extends StatelessWidget {
  const ChecklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 216, 216, 216),
                  ),
                  child: Icon(
                    CupertinoIcons.bell_fill,
                    size: 17,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "   Recent Activities",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lato-Bold',
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 39),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato-Bold'),
                ),
                SizedBox(
                  width: 21,
                ),
                Text('Inprogress'),
                SizedBox(
                  width: 21,
                ),
                Text('Completed')
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ActivityNotificator(
            text: 'Inspection',
            icon: CupertinoIcons.text_badge_checkmark,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityNotificator(
            text: 'Oil Change',
            icon: CupertinoIcons.drop,
          ),
          SizedBox(
            height: 15,
          ),
          ActivityNotificator(
            text: 'Washing',
            icon: CupertinoIcons.sparkles,
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';

class ActivityNotificator extends StatelessWidget {
  final String? text;
  final String? text2;
  final IconData? icon;
  const ActivityNotificator({super.key, this.text, this.text2, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // ignore: prefer_const_constructors
            color: Color.fromARGB(255, 253, 252, 252),
            spreadRadius: 1,
            offset: Offset(0, 1.0),
            blurRadius: 6.0,
          )
        ],
        gradient: LinearGradient(colors: [
          kPrimaryColor.withOpacity(.2),
          kPrimaryColor.withOpacity(.1),
        ]),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: ListTile(
          leading: Icon(
            icon,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 40,
          ),
          title: Text(
            text!,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Lato-Bold',
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: SizedBox(
            width: 97.0,
            height: 38.0,
            child: ElevatedButton(
              onPressed: () {
                // Add your code here
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              child: Text(
                'Pay Now',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

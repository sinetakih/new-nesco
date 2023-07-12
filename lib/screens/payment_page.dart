// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';
import 'package:nesco/screens/HomeNavigation.dart';
import 'package:nesco/screens/widgets/button_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 19,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 110,
                ),
                Center(
                  child: Text(
                    'Payment',
                    style: TextStyle(
                      fontFamily: 'Lato-Regular',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Payment Received',
            style: TextStyle(
              fontFamily: 'Lato-Bold',
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Our team will reach out to you soon...',
            style: TextStyle(
              fontFamily: 'Lato-Regular',
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Image.asset(
            "assets/image/allgood.png",
            width: 250,
          ),
          SizedBox(
            height: 45,
          ),
          GeneralButton(
            color: kSecondaryColor,
            buttonText: 'Continue',
            onTouch: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeNavigation(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

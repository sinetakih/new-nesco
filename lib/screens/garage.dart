// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';
import 'package:nesco/screens/widgets/button_widget.dart';
import 'package:nesco/screens/widgets/cards_widget.dart';
import 'package:nesco/screens/widgets/formdata_field.dart';

class Garage extends StatelessWidget {
  const Garage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
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
                    CupertinoIcons.car_detailed,
                    size: 17,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "   My Garage",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lato-Bold',
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          CardsBox(
            text1: 'Currently requesting for :',
            text2: '2015 Toyota Venza',
            text3: 'XLE 4dr Wagon AWD',
            infotext: '',
            messagetext: '',
            image: AssetImage(
              'assets/image/venza3.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add A Different Vehicle',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lato-Bold'),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.add,
                    )),
              ],
            ),
          ),
          FormDataField(),
          SizedBox(
            height: 32,
          ),
          GeneralButton(
            buttonText: 'Add Vehicle',
            color: kPrimaryColor,
          )
        ],
      ),
    ));
  }
}

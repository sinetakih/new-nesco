// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CardsBox extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  final String infotext;
  final String messagetext;
  final AssetImage? image;
  const CardsBox({
    super.key,
    this.text1,
    this.text2,
    this.text3,
    this.image,
    required this.infotext,
    required this.messagetext,
    //this.infotext,
    // this.messagetext,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      shadowColor: const Color.fromARGB(255, 79, 78, 78),
      child: Container(
        width: 365,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 50,
          ),
          child: Column(
            children: [
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1!,
                        style: TextStyle(
                          fontFamily: 'Lato-Regular',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Text(
                        text2!,
                        style: TextStyle(
                          fontFamily: 'Lato-Bold',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        text3!,
                        style: TextStyle(
                          fontFamily: 'Lato-Regular',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Text(
                        infotext,
                        //textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Lato-Bold',
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: image!,
                        width: 140,
                        height: 84,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                messagetext,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato-Regular',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  // textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';

class HomeCard extends StatelessWidget {
  final String? inspectionText;
  final String? amount;
  final IconData? icon;

  // final AssetImage? image;

  const HomeCard({
    super.key,
    this.icon,
    this.inspectionText,
    this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 156,
        height: 175,
        decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 45,
            ),
            Icon(
              icon,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 33,
            ),
            // SizedBox(
            //   height: 70,
            // ),
            const Spacer(),
            Column(
              children: [
                SizedBox(
                  height: 1,
                ),
                Container(
                    width: 147,
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            inspectionText!,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lato-Bold',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            amount!,
                            style: TextStyle(
                              fontFamily: 'Lato-Regular',
                              color: const Color.fromARGB(
                                255,
                                119,
                                119,
                                119,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 7,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

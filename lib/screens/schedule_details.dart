// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesco/screens/payment_page.dart';
import 'package:nesco/screens/widgets/button_widget.dart';

import '../constant.dart';
import 'widgets/contact_details.dart';

class ScheduleDetails extends StatelessWidget {
  const ScheduleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    width: 80,
                  ),
                  Center(
                    child: Text(
                      'Schedule Details',
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
            Column(
              children: [
                ContactDetails(
                  hintext: 'Input Your Address',
                ),
                ContactDetails(
                  hintext: 'Schedule Date',
                ),
                ContactDetails(
                  hintext: 'More Information',
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                ),
                SizedBox(
                  height: 50,
                ),
                GeneralButton(
                  buttonText: 'Confirm & Proceed To Pay',
                  color: kSecondaryColor,
                  onTouch: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

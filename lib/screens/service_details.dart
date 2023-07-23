// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';
import 'package:nesco/screens/schedule_details.dart';
import 'package:nesco/screens/widgets/button_widget.dart';
import 'package:nesco/screens/widgets/cards_widget.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9),
          child: Column(
            children: [
              SizedBox(
                height: 55,
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
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
                      'Service Details',
                      style: TextStyle(
                        fontFamily: 'Lato-Regular',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              CardsBox(
                text1: 'Currently requesting for :',
                text2: '2015 Toyota Venza',
                text3: 'XLE 4dr Wagon AWD',
                infotext: 'Vehicle Inspection',
                messagetext:
                    'Vehicle inspection service offers a comprehensive evaluation of a vehicle\'s condition to ensure its safety and reliability. Our team of experienced mechanics provides a thorough inspection of all major components, including brakes, tires, suspension, and engine.',
                image: AssetImage(
                  'assets/image/venza3.png',
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 64,
                  ),
                  GeneralButton(
                    buttonText: 'Request Now',
                    color: kPrimaryColor,
                    isMap: true,
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  GeneralButton(
                    buttonText: 'Schedule Later',
                    color: kSecondaryColor,
                    onTouch: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScheduleDetails(),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

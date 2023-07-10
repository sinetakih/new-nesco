// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';

class Garage extends StatelessWidget {
  const Garage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: Icon(Icons.car_crash),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              "   My Garage",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        Container(
            width: 400,
            height: 156,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Manage",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      "Currently requesting for :",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "2015 Toyota Venza",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "XLE 4dr Wagon AWD",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                SizedBox(
                  width: 90,
                ),
                Column(
                  children: [Image.asset("assets/image/venza3.png")],
                ),
                SizedBox(height: 220),
                Text(
                  "Add Vehicle",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 12),
                Text(
                  "Please input your vehicle details",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 34),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Vehicle Reg No."),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black,
                      hintText: 'Ex. NW 905 AG',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("VIN Number / Chassis Number"),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kBgColor,
                      hintText: 'Ex. SV30-0169266',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  height: 55,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Add Vehicle'),
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have your details handy?"),
                    InkWell(child: Text(" Skip Now")),
                  ],
                ),
              ],
            )),
      ],
    ));
  }
}

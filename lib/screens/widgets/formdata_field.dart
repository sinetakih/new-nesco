// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../constant.dart';

class FormDataField extends StatefulWidget {
  FormDataField({super.key});

  @override
  State<FormDataField> createState() => _FormDataFieldState();
}

class _FormDataFieldState extends State<FormDataField> {
  final TextEditingController regNumberController = TextEditingController();

  final TextEditingController vinController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    regNumberController.dispose();
    vinController.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Row(
              children: [
                Text("Vehicle Reg No."),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: regNumberController,
              decoration: InputDecoration(
                filled: true,
                fillColor: kBgColor,
                hintText: 'Ex. NW 905 AG',
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("VIN Number / Chassis Number"),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: vinController,
              decoration: InputDecoration(
                filled: true,
                fillColor: kBgColor,
                hintText: 'Ex. SV30-0169266',
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

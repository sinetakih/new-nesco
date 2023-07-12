// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesco/constant.dart';

class ContactDetails extends StatelessWidget {
  final String? hintext;
  final TextInputType? keyboardType;
  final int? maxLines;
  const ContactDetails({
    super.key,
    this.hintext,
    this.maxLines,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextFormField(
              keyboardType: keyboardType,
              maxLines: maxLines,
              decoration: InputDecoration(
                filled: true,
                fillColor: kBgColor,
                hintText: hintext,
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

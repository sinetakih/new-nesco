// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const MenuItems({
    super.key,
    this.icon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          SizedBox(
            width: 18,
          ),
          Text(
            text!,
            style: TextStyle(
              fontFamily: 'Lato-Regular',
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}

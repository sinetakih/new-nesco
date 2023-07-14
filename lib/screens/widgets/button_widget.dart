// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String? buttonText;
  final Color? color;
  final Function? onTouch;
  final TextEditingController regNumberController = TextEditingController();

  final TextEditingController vinController = TextEditingController();
  GeneralButton({
    super.key,
    this.buttonText,
    this.color,
    this.onTouch,
  });

  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          onTouch!();
        },
        style: ElevatedButton.styleFrom(
          primary: color!,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          buttonText!,
          style: TextStyle(
            fontFamily: 'Lato-Bold',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

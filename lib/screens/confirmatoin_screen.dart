import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmationScren extends StatelessWidget {
  const ConfirmationScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.black,
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Service Details',
                      style: TextStyle(
                        fontFamily: 'Lato-Regular',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Column(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}

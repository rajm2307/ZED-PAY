import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class successfully_page extends StatelessWidget {
  const successfully_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Center(
                  child: Text(
            'Your T-PIN has \n Updated Successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w800, color: Color.fromRGBO(0, 0, 0, 1)),
          )))
        ],
      ),
    );
  }
}

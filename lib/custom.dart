import 'package:calculator/text.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class MyData extends StatelessWidget {
  const MyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LikeButton()
      // Center(
      //   child: Custom_Text(
      //     fSize: 20,
      //      text: 'Hi Developers',
      //      textColor: Colors.red,
          
      //   ),
      // ),
    );
  }
}
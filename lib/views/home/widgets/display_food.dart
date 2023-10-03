import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GridFood extends StatelessWidget {
  const GridFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          // ),
          child: LottieBuilder.asset("assets/images/food1.json"),
        ),
        const Text(
          "Foods",
          style: TextStyle(fontWeight: FontWeight.bold, height: 2),
        )
      ],
    );
  }
}

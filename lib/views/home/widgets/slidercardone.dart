import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderOneCard extends StatelessWidget {
  const SliderOneCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color:Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: "Food Delivery\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.black87)),
                    WidgetSpan(
                      child: SizedBox(height: 25),
                    ),
                    TextSpan(
                        text: "Order food you love",
                        style: TextStyle(fontSize: 15, color: Colors.black54)),
                  ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 200,
                      child: Image.asset('assets/images/food.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

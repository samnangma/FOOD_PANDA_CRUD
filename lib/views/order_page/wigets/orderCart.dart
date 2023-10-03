import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderCart extends StatelessWidget {
  const OrderCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/kdrink.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //sth above the image
            Positioned(
                bottom: 10,
                right: 5,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 25),
                  ),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 30),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\$ 3.75 ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '\$ 4.80',
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.black45))
                  ],
                ),
                textScaleFactor: 0.5,
              ),
              const Text(
                "Milk Tea Top 1",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        )
      ],
    );
  }
}

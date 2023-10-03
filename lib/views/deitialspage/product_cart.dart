import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/kdrink1.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          //sth above the image
          const Positioned(
              height: 30,
              top: 20,
              left: 10,
              child: Text(
                "Milk Tea",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              )),
          Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black26),
                    color: Colors.white),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                  child: Text(
                    "from \$ 3.65",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

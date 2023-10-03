import 'package:flutter/material.dart';
import 'package:foodpanda_ui_clone/views/deitialspage/product_detials.dart';
import 'package:foodpanda_ui_clone/views/home/homescreen.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.pink[600],
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
              // Add your onPressed logic here
            },
          ),
          title: Text(
            "Cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          actions: [],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/cart.png',
                width: 200,
              ),
              SizedBox(height: 16),
              Text(
                "Hungry?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 13),
              Text("You haven't anything to your cart!"),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductDetailsPage()));
              // Add your onPressed logic here
            },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink[600]),
                ),
                child: Text(
                  "Browse",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

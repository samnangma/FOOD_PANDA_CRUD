import 'package:flutter/material.dart';
import 'package:foodpanda_ui_clone/views/deitialspage/product.dart';
import 'package:foodpanda_ui_clone/views/order_page/viewcart_page.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<String> productTitles = [
    "Popular",
    "Coffee",
    "MilkTea",
  ];
  int currentTabIndex = 0;
  PageController _pageController = PageController(keepPage: true);

  // Sample data for products in each category
  List<Product> popularProducts = [
    Product(name: "", description: ""),
    Product(name: "", description: ""),

  ];

  List<Product> coffeeProducts = [
    Product(name: "", description: ""),
    Product(name: "", description: ""),
   
  ];

  List<Product> milkTeaProducts = [
    Product(name: "", description: ""),
    Product(name: "", description: ""),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentTabIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "20 min",
              style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
            )
          ],
        ),
        actions: [
          Icon(
            Icons.favorite_border_outlined,
            color: Colors.pink.shade600,
            size: 30,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.search,
            color: Colors.pink.shade600,
            size: 35,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "KOI The Cambodia",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black54, fontSize: 36),
                        children: <TextSpan>[
                          TextSpan(text: '1.2 km away |'),
                          TextSpan(
                              text: ' Free delivery',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      textScaleFactor: 0.5,
                    ),
                    Text(
                      "More info",
                      style: TextStyle(
                          color: Colors.pink.shade600,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_border_outlined,
                          color: Colors.pinkAccent,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 36),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '4.3',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text: '  | 99 ratings',
                                  style: TextStyle(color: Colors.black54)),
                            ],
                          ),
                          textScaleFactor: 0.5,
                        ),
                      ],
                    ),
                    Text(
                      "See reviews",
                      style: TextStyle(
                          color: Colors.pink.shade600,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.alarm_add_outlined,
                          color: Colors.pinkAccent,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Delivery 20 min",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )
                      ],
                    ),
                    Text(
                      "Change",
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 60,
          decoration: const BoxDecoration(color: Colors.white),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productTitles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Padding(
                  // Add Padding widget
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0), // Add horizontal padding
                  child: Text(
                    productTitles[index],
                    style: TextStyle(
                      fontSize: 18,
                      color: index == currentTabIndex
                          ? Colors.pink[600]
                          : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewCartPage()),
              );
            },
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: productTitles.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Adjust the width of each section
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0), // Adjust vertical spacing here
                  child: _buildProductSection(index),
                );
              },
            ),
          ),
        )
      ]),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewCartPage()),
          );
        },
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.pink.shade600,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    Text(
                      "View your cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "\$ 3.75",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection(int index) {
    // Conditionally choose ListView or GridView based on the category's index
    if (index == 0) {
      return ProductSection(
        title: productTitles[index],
        products: popularProducts,
        isGridView: false,
      );
    } else {
      return ProductSection(
        title: productTitles[index],
        products: _getProductsForCategory(index),
        isGridView: true,
      );
    }
  }

  List<Product> _getProductsForCategory(int categoryIndex) {
    switch (categoryIndex) {
      case 1:
        return coffeeProducts;
      case 2:
        return milkTeaProducts;
      default:
        return [];
    }
  }
}

class Product {
  final String name;
  final String description;

  Product({required this.name, required this.description});
}

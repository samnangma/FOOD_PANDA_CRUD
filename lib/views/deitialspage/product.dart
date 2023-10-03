import 'package:flutter/material.dart';
import 'package:foodpanda_ui_clone/views/deitialspage/product_cart.dart';
import 'package:foodpanda_ui_clone/views/deitialspage/product_detials.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<Product> products;
  final bool isGridView;

  ProductSection({
    required this.title,
    required this.products,
    required this.isGridView,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (!isGridView)
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildProductCard(products[index]);
                },
              )
            else
              // ignore: unused_local_variable
              for (var product in products)
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.white70,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Milk Tea",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                'The Best Milk Tea. Drink it ... Enjoy !!',
                                style: TextStyle(color: Colors.black45),
                                maxLines:
                                    2, // Set max lines for the description
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis if it exceeds max lines
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text("from \$ 3.26"),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Image.asset("assets/images/kdrink1.jpg",
                                height: 110),
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            // Add more content for the product section if needed
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return const ProductCart();
  }
}




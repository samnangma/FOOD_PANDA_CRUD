import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_ui_clone/views/deitialspage/product_detials.dart';

class NearRestaurant extends StatelessWidget {
  const NearRestaurant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetailsPage()));
      },
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CupertinoColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width * .8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/Food1.jpeg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      top: 50,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          color: Colors.black87,
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Top restaurant",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      top: 10,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          color: Colors.pink,
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "25% OFF",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                    const Positioned(
                      bottom: 8,
                      left: 5,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "KKK Restaurant",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$\$ American Foods",
                              maxLines: 1,
                            ),
                          ]),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 5,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[600],
                          ),
                          const Text(
                            "4.6",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "(600+)",
                            maxLines: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

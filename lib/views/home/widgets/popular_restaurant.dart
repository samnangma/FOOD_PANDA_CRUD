import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopRestaurant1 extends StatelessWidget {
  const TopRestaurant1 ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/koi.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      color: Colors.black87,
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(7),
                        child: Text(
                          "Top restaurant",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "25 min",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        )),
                  ),
                ),
              ],
            )),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "KOI The Cambodia",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "\$\$\$ Tea & Coffee, Milk Tea,",
              maxLines: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "\$ 0.65 delivery fee",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

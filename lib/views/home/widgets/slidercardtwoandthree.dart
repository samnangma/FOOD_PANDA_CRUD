import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderThreeCard extends StatelessWidget {
  const SliderThreeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color:Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: "Groceries\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black87)),
                            WidgetSpan(
                              child: SizedBox(height: 20),
                            ),
                            TextSpan(
                                text: "Supermarkets,Marts, Shops, & More",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54)),
                          ])),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 70, bottom: 5),
                          child: Image.asset('assets/images/drink.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 10, left: 15),
                                    child: RichText(
                                        text: const TextSpan(children: [
                                      TextSpan(
                                          text: "Pick-up\n",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black87)),
                                      WidgetSpan(
                                        child: SizedBox(height: 20),
                                      ),
                                      TextSpan(
                                          text: "Up to 50% off",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54)),
                                    ])),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 120, bottom: 5),
                                    child: Container(
                                        width: 250,
                                        child: Image.asset(
                                          'assets/images/pickup.png',
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Row(
                              children: [
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RichText(
                                        text: const TextSpan(children: [
                                      TextSpan(
                                          text: "Pandasend\n",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.black87)),
                                      WidgetSpan(
                                        child: SizedBox(height: 20),
                                      ),
                                      TextSpan(
                                          text: "send parcels in a tap",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54)),
                                    ])),
                                  ),
                                ),
                                Expanded(
                                  child: Image.asset('assets/images/send.png'),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

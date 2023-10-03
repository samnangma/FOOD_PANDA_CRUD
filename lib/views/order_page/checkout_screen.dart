import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_ui_clone/views/order_page/order_final_screen.dart';
import 'package:foodpanda_ui_clone/views/order_page/viewcart_page.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  bool isSwitch = false;
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewCartPage()),
              );
            },
          ),
          title: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Checkout\n",
                  style: TextStyle(
                    fontSize: 20, // Adjust the font size as needed
                    color: Colors.black, // Change the text color to black
                    fontWeight: FontWeight.bold,
                  ),
                ),
                WidgetSpan(
                    child: SizedBox(
                  height: 22,
                )),
                TextSpan(
                  text: "128 KOI THE Cambodia(TK)",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
          backgroundColor: Colors.white, // Set the background color to white
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: BorderDirectional(
                        bottom: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                        end: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                        start: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 2,
                        ),
                        const Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.pinkAccent,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Delivery address",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.edit_location_alt_outlined,
                                  color: Colors.pinkAccent,
                                  size: 30,
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://miro.medium.com/v2/resize:fit:828/format:webp/1*qYUvh-EtES8dtgKiBRiLsA.png',
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: '247a St 168',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      fontSize: 20)),
                              WidgetSpan(
                                  child: SizedBox(
                                height: 10,
                              )),
                              TextSpan(
                                  text: '\nPhom Penh',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 18)),
                              WidgetSpan(
                                  child: SizedBox(
                                height: 10,
                              )),
                            ])),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 70,
                            decoration: const BoxDecoration(
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                  color: Colors.black12,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.pink[600],
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Add delivery instruction",
                                  style: TextStyle(
                                      color: Colors.pink[600],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const SizedBox(
                              width: 300,
                              child: Text(
                                "Contactless delivery: switch to online payment for this option",
                                softWrap: true,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Switch(
                                value: isSwitch,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitch = true;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: BorderDirectional(
                        bottom: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                        end: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                        start: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      )),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.wallet_outlined,
                              color: Colors.pinkAccent,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Payment method",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Spacer(),
                            Icon(
                              Icons.edit,
                              color: Colors.pinkAccent,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.money,
                              color: Colors.pinkAccent,
                              size: 30,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Cash",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Spacer(),
                            Text(
                              "\$ 5.68",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: BorderDirectional(
                        bottom: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                        end: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                        start: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      )),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.currency_exchange,
                            size: 30,
                            color: Colors.pinkAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Tip your rider",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "100% of the tips go to yours rider we don't deduct anything form it",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.black26, width: 1),
                                color: Colors.white),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Not Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.black26, width: 1),
                                color: Colors.white),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "\$0.25",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.black26, width: 1),
                                color: Colors.white),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "\$0.50",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.black26, width: 1),
                                color: Colors.white),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "\$0.75",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: isCheck,
                              activeColor: Colors.pink[600],
                              onChanged: (value) {
                                setState(() {
                                  isCheck = true;
                                });
                              }),
                          const Text(
                            "Save for your next order",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: BorderDirectional(
                          bottom: BorderSide(
                            color: Colors.black12,
                            width: 2,
                          ),
                          end: BorderSide(
                            color: Colors.black12,
                            width: 2,
                          ),
                          start: BorderSide(
                            color: Colors.black12,
                            width: 2,
                          ),
                        )),
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.record_voice_over_rounded,
                              color: Colors.pinkAccent,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Order Summary",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "2x Milk Tea",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              '\$2.68',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Subtotal",
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              '\$2.89',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Delivery fee",
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              '\$2.63',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "VAT",
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              '\$0.28',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "By placing your order your agree to our Terms & Conditions, "
                      "We will process your personal data necessary to deliver your order."
                      "You can learn more on how we process your personal data in Privacy Policy."),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Total (VAT)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "\$7.68",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "See price breakdown",
                  style: TextStyle(
                    color: Colors.pink.shade600,
                    fontSize: 13,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Lotti()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 53,
                    child: const Center(
                      child: Text(
                        'Place Order',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

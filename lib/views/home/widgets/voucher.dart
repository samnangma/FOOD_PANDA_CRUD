import 'package:flutter/cupertino.dart';

class Voucher extends StatelessWidget {
  const Voucher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("assets/images/promo.jpeg"),
                    fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}

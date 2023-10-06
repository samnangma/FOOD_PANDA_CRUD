import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cuisines extends StatefulWidget {
  final items;
  final uri;
const Cuisines({
    super.key, required this.items,
  required this.uri
  });

  @override
  State<Cuisines> createState() => _CuisinesState();
}

class _CuisinesState extends State<Cuisines> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 120,
          decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[100]
          ),
         child: Image.network('https://cms.istad.co${widget.uri}'),
        ),
        Text("${widget.items?.title}",
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              height: 2
          ),)
      ],
    );
  }
}
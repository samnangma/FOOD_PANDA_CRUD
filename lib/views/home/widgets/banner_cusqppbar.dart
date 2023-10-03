import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_ui_clone/views/search_page/seachpage.dart';

class MysliverBanerCus extends StatelessWidget {
  const MysliverBanerCus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 100,
      pinned: false,
      // snap: true,
      floating: false,
      backgroundColor: Colors.pink[700],
      flexibleSpace: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              // Navigate to desired screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
              child: const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Search for shops & restaurants")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawerCus extends StatelessWidget {
  const MyDrawerCus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        
        width: MediaQuery.of(context).size.width * .85,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.pink[700],
                ),
                currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                        'https://i.pinimg.com/originals/5f/b2/1a/5fb21aefc0aa94d8a84531611d8fe708.png')),
                currentAccountPictureSize: Size.square(50),
                accountName: const Text(
                  "Samanng Ma",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                accountEmail: null),
            ListTile(
              title: const Text(
                "Become a pandapro",
              ),
              leading: Icon(
                Icons.pages_rounded,
                color: Colors.pink[600],
              ),
            ),
            ListTile(
              title: const Text(
                "Favorites",
              ),
              leading: Icon(
                Icons.favorite_border,
                color: Colors.pink[600],
              ),
            ),
            ListTile(
              title: const Text(
                "Voucher & Offers",
              ),
              leading: Icon(
                Icons.confirmation_num_outlined,
                color: Colors.pink[600],
              ),
            ),
            ListTile(
              title: const Text(
                "Orders & reordering",
              ),
              leading: Icon(
                Icons.library_books_sharp,
                color: Colors.pink[600],
              ),
            ),
            ListTile(
              title: const Text(
                "Profile",
              ),
              leading: Icon(
                Icons.perm_identity_rounded,
                color: Colors.pink[600],
              ),
            ),
            ListTile(
              title: Text(
                "Address",
              ),
              leading: Icon(
                Icons.location_on_outlined,
                color: Colors.pink[600],
              ),
            ),
            ListTile(
              title: Text(
                "Payment methods",
                style: GoogleFonts.poppins(),
              ),
              leading: Icon(
                Icons.payment_rounded,
                color: Colors.pink[600],
              ),
            ),
            ListTile(
              title: const Text(
                "panda rewards",
              ),
              leading: Icon(
                Icons.wallet_giftcard,
                color: Colors.pink[600],
              ),
            ),
            ListTile(
              title: const Text(
                "Help center",
              ),
              leading: Icon(
                Icons.help,
                color: Colors.pink[600],
              ),
            ),
            ListTile(
              title: Text(
                "Invite friends",
                style: GoogleFonts.poppins(),
              ),
              leading: Icon(
                Icons.card_giftcard_rounded,
                color: Colors.pink[600],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        height: 2,
                      ),
                      children: [
                    TextSpan(text: "Settings\n"),
                    WidgetSpan(
                      child: SizedBox(height: 60),
                    ),
                    TextSpan(text: "Terms & Conditions / Privacy\n"),
                    WidgetSpan(
                      child: SizedBox(height: 60),
                    ),
                    TextSpan(text: "Log out\n"),
                    WidgetSpan(
                      child: SizedBox(height: 60),
                    ),
                  ])),
            )
          ],
        ));
  }
}

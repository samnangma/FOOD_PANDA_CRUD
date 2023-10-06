import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodpanda_ui_clone/views/home/model/cuisines.dart';
import 'package:foodpanda_ui_clone/views/home/widgets/banner_cusqppbar.dart';
import 'package:foodpanda_ui_clone/views/home/widgets/cuisine.dart';
import 'package:foodpanda_ui_clone/views/home/widgets/display_food.dart';
import 'package:foodpanda_ui_clone/views/home/widgets/mydrawer_cus.dart';
import 'package:foodpanda_ui_clone/views/home/widgets/near_food_restaurant.dart';
import 'package:foodpanda_ui_clone/views/home/widgets/slidercardone.dart';
import 'package:foodpanda_ui_clone/views/home/widgets/slidercardtwoandthree.dart';
import 'package:foodpanda_ui_clone/views/home/widgets/top_restaurant.dart';
import 'package:foodpanda_ui_clone/views/home/widgets/voucher.dart';
import 'package:foodpanda_ui_clone/views/order_page/cart.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isRefreshing = false;

  late Future<CuisinesModel> futureCuisines;
  Future<CuisinesModel> fetchCuisines() async {
    final res = await http.get(
        Uri.parse('https://cms.istad.co/api/food-panda-cuisines?populate=%2A'));
    if (res.statusCode == 200) {
      return cuisinesModelFromJson(res.body);
    } else {
      throw Exception("Failed to fetch Cuisines");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCuisines = fetchCuisines();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshData() async {
    // Perform your refresh logic here
    await Future.delayed(Duration(seconds: 2)); // Simulating a delay
    setState(() {
      _isRefreshing = false;
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Reached the end of the scroll view, load more data if needed
      // Implement your logic to load more data here
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.pink[700],
        ),
        backgroundColor: Colors.pink[700],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
        title: Row(
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: "2 St 562\n",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  TextSpan(text: "Phom Penh"),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.favorite_border_outlined)),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Cart()));
                  // Add your onPressed logic here
                },
                icon: Icon(Icons.card_travel))
          ],
        ),
      ),
      drawer: MyDrawerCus(),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: CustomScrollView(
          slivers: [
            MysliverBanerCus(),
            SliderOneCard(),
            SliderThreeCard(),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Popular Restaurants",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 330,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return TopRestaurant();
                  }),
            )),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Cuisines",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 370,
    
                child: FutureBuilder<CuisinesModel>(
                  future: futureCuisines,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            final item = snapshot.data!.data![index].attributes;
                            final url = snapshot.data!.data![index].attributes
                                ?.thumbnail?.data?.attributes?.url;
                            return Cuisines(items: item, uri: url);
                          });
                    }
                    return const Center(
                      child: Text('No data available.'),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Pick up at a restaurant near you",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.jpg"),
                      fit: BoxFit.cover),
                ),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return NearRestaurant();
                    }),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Shops",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 20, top: 10),
                            child: Column(
                              children: [
                                GridFood(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Your daily deals",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Voucher();
                  }),
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12, width: 2.0)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                          text: "Become a pro",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        TextSpan(
                          text: "\nand get exclusive deals",
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                      ])),
                      Spacer(),
                      Image.network(
                          'https://images.deliveryhero.io/image/foodpanda/pandapro/img_top.png'),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12, width: 2.0)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                          text: "Try panda rewards",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        TextSpan(
                          text: "\nEarn points and win prizes",
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                      ])),
                      Spacer(),
                      Image.network(
                          'https://images.deliveryhero.io/image/foodpanda/corporate/landing_page/illustration_allowancepaupau.png'),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12, width: 2.0)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                          text: "Earn a 3\$ voucher",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        TextSpan(
                          text: "\nwhen you refer a friend",
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                      ])),
                      const Spacer(),
                      Image.asset('assets/images/gift.png'),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_ui_clone/get_model.dart';
import 'package:foodpanda_ui_clone/views/home/widgets/insert.dart';
import 'package:foodpanda_ui_clone/views/home/widgets/update.dart';
import 'package:http/http.dart' as http;

class TopRestaurant extends StatefulWidget {
  const TopRestaurant({
    Key? key,
  }) : super(key: key);

  @override
  State<TopRestaurant> createState() => _TopRestaurantState();
}

class _TopRestaurantState extends State<TopRestaurant> {
  late Future<RestaurantModel> futureRestaurant;
  
  Future<RestaurantModel> fetchRestaurantData() async {
    final response = await http.get(Uri.parse(
        'https://cms.istad.co/api/food-panda-restaurants?populate=*'));
    if (response.statusCode == 200) {
      return restaurantModelFromJson(response.body);
    } else {
      // Handle the error case
      throw Exception('Failed to fetch restaurant data');
    }
  }

  Future<dynamic> deleteRestaurant(int id) async {
    final response = await http.delete(
      Uri.parse('https://cms.istad.co/api/food-panda-restaurants/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    futureRestaurant = fetchRestaurantData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RestaurantModel>(
      future: futureRestaurant,
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
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: snapshot.data!.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final item = snapshot.data!.data![index].attributes;
              final idpass = snapshot.data!.data![index].id?.toInt();

              return Container(
                height: 800,
                width: 300,
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity * .7,
                        child: Image.network(
                          'https://cms.istad.co${item?.picture?.data?.attributes?.url}',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${item?.name}"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Category: ${item?.category}"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${item?.createdAt}"),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RestaurantForm()),
                                    );
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () async {
                                    if (await confirm(context)) {
                                      return deleteRestaurant(idpass!);
                                    }
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateRestaurantForm(idpass!)),
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: Text('No data available.'),
        );
      },
    );
  }
}




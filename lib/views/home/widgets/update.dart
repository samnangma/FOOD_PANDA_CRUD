// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:foodpanda_ui_clone/insert_model.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;

// class UpdateRestaurantForm extends StatefulWidget {
//   final item;
//   final idpass;
//   final imgid;
//   UpdateRestaurantForm({required this.item, required this.idpass, required this.imgid,super.key});
//   @override
//   _UpdateRestaurantForm createState() => _UpdateRestaurantForm();
// }

// class _UpdateRestaurantForm extends State<UpdateRestaurantForm> {
//   final _formKey = GlobalKey<FormState>();

//   TextEditingController nameController = TextEditingController();
//   TextEditingController categoryController = TextEditingController();
//   TextEditingController discountController = TextEditingController();
//   TextEditingController deliveryFeeController = TextEditingController();
//   TextEditingController deliveryTimeController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     nameController.text = widget.item?.name;
//     categoryController.text=widget.item?.category;
//     discountController.text=widget.item!.discount.toString();
//     deliveryFeeController.text=widget.item!.deliveryFee.toString();
//     deliveryTimeController.text=widget.item!.deliveryTime.toString();
//   }

//   File? images;

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedImage = await ImagePicker().pickImage(source: source);
//     setState(() {
//       if (pickedImage != null) {
//         images = File(pickedImage.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
  
//   Future<int> uploadImage (path) async{
//     var request = http.MultipartRequest('POST', Uri.parse('https://cms.istad.co/api/upload'));
//     // Add the image file to the request
//     if (images != null) {
//       request.files.add(await http.MultipartFile.fromPath('files', path));
//     }
//     // Send the request and handle the response
//     var response = await request.send();
//     if (response.statusCode == 200) {
//       print('API request successful');
//       var responseBody = await response.stream.bytesToString();
//       var parsedResponse = jsonDecode(responseBody);
//       int id = parsedResponse[0]['id'];
//       print('The ID is: $id');
//       print(responseBody);
//       return id;
//     } else {
//       print('API request failed');
//       return widget.item?.picture?.id;
//     }
//   }
//   Future<void> updateDate (jsonData) async{
//     var headers = {
//       'Content-Type': 'application/json'
//     };
//     var requests = http.Request('PUT', Uri.parse('https://cms.istad.co/api/food-panda-restaurants/${widget.idpass}'));
//     requests.body =jsonData;
//     requests.headers.addAll(headers);
//     http.StreamedResponse responses = await requests.send();
//     if (responses.statusCode == 200) {
//       print(await responses.stream.bytesToString());
//     }
//     else {
//       print(responses.reasonPhrase);
//     }
//   }

//   void submitForm() async{
//     if (_formKey.currentState!.validate()) {
//       // Retrieve the form field values from the controllers
//       String name = nameController.text;
//       String category = categoryController.text;
//       int discount = int.parse(discountController.text);
//       double deliveryFee = double.parse(deliveryFeeController.text);
//       int deliveryTime = int.parse(deliveryTimeController.text);
//       // You can perform further actions with the form data and the selected image here
//       //posting Image
//       var ids = images != null ? await uploadImage(images!.path) : widget.imgid;
//       print(ids);
//       //positing restaurant
//       RestaurantInsertModel restaurantData = RestaurantInsertModel(
//         data: Data(
//           name: name,
//           category: category,
//           discount: discount,
//           deliveryFee: deliveryFee,
//           deliveryTime: deliveryTime,
//           picture: "$ids",
//         ),
//       );
//       String jsonData = restaurantInsertModelToJson(restaurantData);
//       print(jsonData);
//       //future insertdata
//       updateDate(jsonData);
//       // Reset the form
//       _formKey.currentState!.reset();
//     // Clear the text field controllers
//     nameController.clear();
//     categoryController.clear();
//     discountController.clear();
//     deliveryFeeController.clear();
//     deliveryTimeController.clear();
//     // Clear the image selection
//     setState(() {
//     images = null;
//     });
//     Navigator.of(context).pop();
//   }
//   }

//   @override
//   void dispose() {
//     // Dispose the text field controllers when the widget is disposed
//     nameController.dispose();
//     categoryController.dispose();
//     discountController.dispose();
//     deliveryFeeController.dispose();
//     deliveryTimeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Restaurant Form'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                 ),
//                 controller: nameController,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Category',
//                 ),
//                 controller: categoryController,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a category';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Discount',
//                 ),
//                 controller: discountController,
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a discount';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Delivery Fee',
//                 ),
//                 controller: deliveryFeeController,
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a delivery fee';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Delivery Time',
//                 ),
//                 controller: deliveryTimeController,
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a delivery time';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () => _pickImage(ImageSource.gallery),
//                 child: const Text('Select Image'),
//               ),
//               const SizedBox(height: 16.0),
//               images != null
//                   ? Image.file(images!)
//                   : Image.network('https://cms.istad.co${widget.item?.picture?.data?.attributes?.url}'),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: submitForm,
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodpanda_ui_clone/insert_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Picture {
  int id;

  Picture({required this.id});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      id: json['id'],
    );
  }
}

class UpdateRestaurantForm extends StatefulWidget {
  final item;
  final idpass;
  final imgid;
  final Function() onDataReload; // Callback function for data reload
  UpdateRestaurantForm({required this.item, required this.idpass, required this.imgid, required this.onDataReload, Key? key})
      : super(key: key);

  @override
  _UpdateRestaurantForm createState() => _UpdateRestaurantForm();
}

class _UpdateRestaurantForm extends State<UpdateRestaurantForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController deliveryFeeController = TextEditingController();
  TextEditingController deliveryTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.item?.name;
    categoryController.text = widget.item?.category;
    discountController.text = widget.item!.discount.toString();
    deliveryFeeController.text = widget.item!.deliveryFee.toString();
    deliveryTimeController.text = widget.item!.deliveryTime.toString();
  }

  File? images;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    setState(() {
      if (pickedImage != null) {
        images = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<int> uploadImage(path) async {
    var request = http.MultipartRequest('POST', Uri.parse('https://cms.istad.co/api/upload'));
    // Add the image file to the request
    if (images != null) {
      request.files.add(await http.MultipartFile.fromPath('files', path));
    }
    // Send the request and handle the response
    var response = await request.send();
    if (response.statusCode == 200) {
      print('API request successful');
      var responseBody = await response.stream.bytesToString();
      var parsedResponse = jsonDecode(responseBody);
      int id = parsedResponse[0]['id'];
      print('The ID is: $id');
      print(responseBody);
      return id;
    } else {
      print('API request failed');
      return widget.item?.picture?.id;
    }
  }

  Future<void> updateData(jsonData) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('PUT', Uri.parse('https://cms.istad.co/api/food-panda-restaurants/${widget.idpass}'));
    request.body = jsonData;
    request.headers.addAll(headers);
    var response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      // Trigger the data reload callback
      widget.onDataReload();
    } else {
      print(response.reasonPhrase);
    }
  }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Retrieve the form field values from the controllers
      String name = nameController.text;
      String category = categoryController.text;
      int discount = int.parse(discountController.text);
      double deliveryFee = double.parse(deliveryFeeController.text);
      int deliveryTime = int.parse(deliveryTimeController.text);
      // You can perform further actions with the form data and the selected image here
      // Posting Image
      var ids = images != null ? await uploadImage(images!.path) : widget.imgid;
      print(ids);
      // Posting restaurant
      RestaurantInsertModel restaurantData = RestaurantInsertModel(
        data: Data(
          name: name,
          category: category,
          discount: discount,
          deliveryFee: deliveryFee,
          deliveryTime: deliveryTime,
          picture: "$ids",
        ),
      );
      String jsonData = restaurantInsertModelToJson(restaurantData);
      print(jsonData);
      // Future insert data
      updateData(jsonData);
      // Reset the form
      _formKey.currentState!.reset();
      // Clear the text field controllers
      nameController.clear();
      categoryController.clear();
      discountController.clear();
      deliveryFeeController.clear();
      deliveryTimeController.clear();
      // Clear the image selection
      setState(() {
        images = null;
      });
      Navigator.of(context).pop();
    }
  }

  @override
void dispose() {
  // Dispose the text field controllers when the widget is disposed
  nameController.dispose();
  categoryController.dispose();
  discountController.dispose();
  deliveryFeeController.dispose();
  deliveryTimeController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Update Restaurant"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                controller: categoryController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Category',
                ),
              ),
              TextFormField(
                controller: discountController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a discount';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Discount',
                ),
              ),
              TextFormField(
                controller: deliveryFeeController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a delivery fee';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Delivery Fee',
                ),
              ),
              TextFormField(
                controller: deliveryTimeController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a delivery time';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Delivery Time',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                },
                child: Text('Select Image'),
              ),
              SizedBox(height: 10),
              if (images != null) Image.file(images!),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: submitForm,
          child: Text('Update'),
        ),
      ],
    );
  }
}
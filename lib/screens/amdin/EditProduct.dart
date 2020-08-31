import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/models/addProduct.dart';
import 'package:store_app/screens/MainProductScreen.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/CustomTextField.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../MainProductScreen.dart';


class AdminEditProduct extends StatefulWidget {
  static const routeName ='/edit-prod';

  @override
  _AdminEditProductState createState() => _AdminEditProductState();
}

class _AdminEditProductState extends State<AdminEditProduct> {

  String nameOfProduct , description , price , quantity ;
  List<String> images = [];

  uploadAssetImages(Asset image) async {
    AddProduct addproductimage = new AddProduct();
    String imageName;
    print("${kUrl}uploadAssetImages");
    Uri uri = Uri.parse("${kUrl}uploadAssetImages");
    http.MultipartRequest request = http.MultipartRequest("POST", uri);
    ByteData byteData = await image.getByteData();
    List<int> imageData = byteData.buffer.asUint8List();
    http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
      'image',
      imageData,
    );
    request.files.add(multipartFile);
// send
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      setState(() {
        images.add(value);
        print(images);
      });

    });

  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text("Edit Product"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),
            onPressed: () async{
              final response = await http.post(
                "${kUrl}addProduct",
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<dynamic, dynamic>{
                  "nameOfProduct": nameOfProduct,
                  "description": description,
                  "price": price,
                  "quantity": quantity,
                  "images": images,
                }),
              );

              final Map responseJson = json.decode(response.body);
              print(responseJson);
              if (responseJson["state"] != null) {
                print(responseJson);
              } else {
                print("--------------------------------------------------------------------");
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              }
            },
           )


        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:75),
        child: Form(
          child: ListView(children: <Widget>[

            CustomTextField(
              hint: 'name of product',
              onchange: (value){
                nameOfProduct = value;
              },
              ),
              SizedBox(height:20),
               CustomTextField(
              hint: 'description of product',
                 onchange: (value){
                   description = value;
                 },
              ),
                            SizedBox(height:20),

               CustomTextField(
              hint: 'price of product',
                 onchange: (value){
                   price = value;
                 },
              ),
                            SizedBox(height:20),

               CustomTextField(
              hint: 'quantity of product',
                 onchange: (value){
                   quantity = value;
                 },
              ),
            SizedBox(height:40),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50,bottom: 5),
              height: 60,
              child: CustomButton(
                text: "add product images",
                fontSize: 20,
                onClick: ()async{
                  List<Asset> images = List<Asset>();
                  List<Asset> resultList = List<Asset>();

                  resultList = await MultiImagePicker.pickImages(
                    maxImages: 300,
                    enableCamera: true,
                    selectedAssets: images,
                    cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
                    materialOptions: MaterialOptions(
                      actionBarColor: "#abcdef",
                      actionBarTitle: "Example App",
                      allViewTitle: "All Photos",
                      useDetailsView: false,
                      selectCircleStrokeColor: "#000000",
                    ),
                  );
                  resultList.forEach((element) async{
                    uploadAssetImages(element);
                  });

                },

              ),
            ),

        ],
          ),
        ),
      ),

    );

  }
  
}
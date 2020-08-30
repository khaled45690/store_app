import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants/uploadAssetImages.dart';
import 'package:store_app/models/addProduct.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/CustomTextField.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


class AdminEditProduct extends StatefulWidget {
  static const routeName ='/edit-prod';

  @override
  _AdminEditProductState createState() => _AdminEditProductState();
}

class _AdminEditProductState extends State<AdminEditProduct> {

  String nameOfProduct , description , price , quantity ;

  Widget build(BuildContext context) {
    AddProduct addProduct = Provider.of<AddProduct>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title:Text("Edit Product"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),
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
                  Timer(const Duration(milliseconds: 1000), () {
                    print(addProduct.productImages);
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
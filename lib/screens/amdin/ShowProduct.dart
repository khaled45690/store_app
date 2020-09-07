

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/MainProductModel.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/addproductWidget.dart';

import 'AddItem.dart';
import 'EditProduct.dart';

class ShowProducts extends StatefulWidget {
  static const routeName ='/user-product';

  @override
  _ShowProductsState createState() => _ShowProductsState();
}

class _ShowProductsState extends State<ShowProducts> {
    List products = [];

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    MainProductModel mainProductModel = Provider.of<MainProductModel>(context, listen: false);
    mainProductModel.getMainProduct();
    Timer(const Duration(milliseconds: 500), () {
      mainProductModel.printoo();
    });

  }
  @override
  Widget build(BuildContext context) {
    final productData =Provider.of<Products>(context);
        MainProductModel mainProductModel = Provider.of<MainProductModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title:const Text('all the products Products'),
        actions:<Widget>[
          IconButton(icon:Icon(Icons.add),
          onPressed:(){
            Navigator.of(context).pushNamed(AddItem.routeName);

          }
          
          )
          
        ]
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: mainProductModel.products.length,
          //productData.items.length,
          itemBuilder:(_,i)=> Column(
            
            children: [
              UserProductItem(
                mainProductModel.products[i]
                // productData.items[i].id,
                // productData.items[i].name,
                // productData.items[i].imageUrl,
                // productData.items[i].price.toString()
                              
                ),
                Divider(),
            ],
          ) ,
        )),
      
    );
  }
}
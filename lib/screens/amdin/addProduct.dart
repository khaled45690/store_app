

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/addproductWidget.dart';

import 'EditProduct.dart';

class AdminAddProduct extends StatelessWidget {
  static const routeName ='/user-product';
  @override
  Widget build(BuildContext context) {
    final productData =Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title:const Text('all the products Products'),
        actions:<Widget>[
          IconButton(icon:Icon(Icons.add),
          onPressed:(){
            Navigator.of(context).pushNamed(AdminEditProduct.routeName);

          }
          
          )
          
        ]
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder:(_,i)=> Column(
            
            children: [
              UserProductItem(
                productData.items[i].id,
                productData.items[i].name,
                productData.items[i].imageUrl
                ),
                Divider(),
            ],
          ) ,
        )),
      
    );
  }
}
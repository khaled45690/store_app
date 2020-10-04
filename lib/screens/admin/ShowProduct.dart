import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/MainProductModel.dart';
import 'package:store_app/widgets/addproductWidget.dart';
import 'AddItem.dart';

class ShowProducts extends StatefulWidget {
  static const routeName ='/user-product';

  @override
  _ShowProductsState createState() => _ShowProductsState();
}

class _ShowProductsState extends State<ShowProducts> {
  Widget build(BuildContext context) {

    MainProductModel mainProductModel = Provider.of<MainProductModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title:const Text('all the products'),
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
          itemBuilder:(_,i)=> Column(
            
            children: [
              UserProductItem(mainProductModel.products[i]),
                Divider(),
            ],
          ) ,
        )),
      
    );
  }
}
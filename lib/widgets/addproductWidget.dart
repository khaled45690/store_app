import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/productDetails.dart';

class UserProductItem extends StatefulWidget {
  // final String id;
  // final String name;
  // final String imageUrl;
  //   final String price;
     final Map product;
  UserProductItem(this.product);

  // UserProductItem(this.id, this.name, 
  // this.imageUrl,
  // this.price
  // );

  @override
  _UserProductItemState createState() => _UserProductItemState(productMap : this.product);
}

class _UserProductItemState extends State<UserProductItem> {
    Map productMap;
  int quantity = 1;
   _UserProductItemState({this.productMap});
  @override
  Widget build(BuildContext context) {
    //   final product = Provider.of<Product>(context);
        List images = productMap["images"];


    return Dismissible(
      key: ValueKey(productMap["_id"]),
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white
        ),
        alignment: Alignment.centerRight ,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
         confirmDismiss: (ctx){
             return  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('Are you sure?'),
                            content: Text("Do you want to remove the item ?"),
                            backgroundColor: Colors.white,
                            actions: <Widget>[
                              FlatButton(
                                onPressed: (){
                                  Navigator.of(ctx).pop(false);
                                },
                               child: Text("no")
                               ),
                              FlatButton(
                                onPressed: (){
                                      Navigator.of(ctx).pop(true);

                                },
                               child: Text("yes"),
                               )
                            ],
                          )
                          );
            },
            onDismissed:(direction){
                 Provider.of<Products>(context,listen: false).deleteProduct(productMap["_id"]);
            },
      child: Card(
        
        child: ListTile(
          onTap: (){
                      Navigator.of(context).pushNamed(
            ProductDetails.routeName,
            arguments: productMap["_id"]
                      );
          },
            
          title: Text(productMap["nameOfProduct"]),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              "${kUrl}getImage/${jsonDecode(images[0])}"
            ),
          ),
          trailing: Container(
            width: 50,
            child: Row(
              children: <Widget>[
                // IconButton(
                //   icon: Icon(Icons.edit),
                //   color: Colors.blue,
                //   onPressed: () {},
                // ),
                Text(productMap["price"])
             
              
                //  IconButton(icon: Icon(Icons.delete),
                // onPressed: (){

                // },
                // color: Colors.red,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/models/MainProductModel.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/productDetails.dart';

class UserProductItem extends StatefulWidget {
  final Map product;
  UserProductItem(this.product);

  @override
  _UserProductItemState createState() =>
      _UserProductItemState(productMap: this.product);
}

class _UserProductItemState extends State<UserProductItem> {
  Map productMap;
  int quantity = 1;
  _UserProductItemState({this.productMap});
  @override
  Widget build(BuildContext context) {
    MainProductModel mainProductModel =
        Provider.of<MainProductModel>(context, listen: false);
    List images = productMap["images"];
    Map image = images[0];
    String imageUrl = image["url"];

    return Dismissible(
      key: ValueKey(productMap["_id"]),
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (ctx) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text("Do you want to remove the item ?"),
                  backgroundColor: Colors.white,
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: Text("no")),
                    FlatButton(
                      onPressed: () {
                        mainProductModel.deleteProduct(productMap);
                        mainProductModel.getMainProduct();
                        Navigator.of(context).pop(true);
                      },
                      child: Text("yes"),
                    )
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Products>(context, listen: false)
            .deleteProduct(productMap["_id"]);
      },
      child: Card(
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetails.routeName,
                arguments: productMap["_id"]);
          },
          title: Text(productMap["nameOfProduct"]),
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage(imageUrl),
          ),
          trailing: Container(
            width: 50,
            child: Row(
              children: <Widget>[Text(productMap["price"])],
            ),
          ),
        ),
      ),
    );
  }
}

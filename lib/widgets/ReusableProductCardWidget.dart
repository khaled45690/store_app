import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants/kConstants.dart';

import 'CustomButton.dart';
class ReusableCardWidget extends StatefulWidget {
   final Map product;

   ReusableCardWidget(this.product);
  @override
  _ReusableCardWidgetState createState() => _ReusableCardWidgetState(productMap : product);
}

class _ReusableCardWidgetState extends State<ReusableCardWidget> {
   Map productMap;

   _ReusableCardWidgetState({this.productMap});

  @override
  Widget build(BuildContext context) {
    List images = productMap["images"];
    print("$kUrl${jsonDecode(images[0])}");
    return Container(
      padding: EdgeInsets.only(bottom:10),
      margin: EdgeInsets.all(3),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 140,
                  height: 200,
                  margin: EdgeInsets.only(top: 10),
                  child: Image.network("${kUrl}getImage/${jsonDecode(images[0])}"),
                ),
                SizedBox(height: 20.0),
                Text(
                  productMap["nameOfProduct"],
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 18,

                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                //  '\$${widget.price.toString()}',
                "${ productMap["price"]} \$",
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 18,

                  ),
                ),
                SizedBox(height: 20.0),
                CustomButton(text: "add to cart", fontSize: 15,),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.only(bottom: 280 , top: 20),
                color: Colors.red,
                icon: Icon(Icons.favorite),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
  }



















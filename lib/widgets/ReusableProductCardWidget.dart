import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomButton.dart';
class ReusableCardWidget extends StatefulWidget {
  // final String id;
  // final double price;
  // final int quantity;
  // final String name;
  // ReusableCardWidget(this.id,this.price,this.quantity,this.name);
  @override
  _ReusableCardWidgetState createState() => _ReusableCardWidgetState();
}

class _ReusableCardWidgetState extends State<ReusableCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom:10),
      margin: EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 140,
                child: Image.network("https://specs1.com/wp-content/uploads/2018/10/HUAWEI-Mate-20-Pro-600x600.jpg"),
              ),
              SizedBox(height: 20.0),
              Text(
                "name of product",
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 18,

                ),
              ),
              SizedBox(height: 20.0),
              Text(
              //  '\$${widget.price.toString()}',
              "price of product",
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 18,

                ),
              ),
              SizedBox(height: 60.0),
              CustomButton(text: "add to cart", fontSize: 15,),
            ],
          ),
          Column(
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.only(bottom: 260),
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



















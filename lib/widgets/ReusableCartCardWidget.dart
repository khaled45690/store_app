import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/producttt.dart';

class ReusableCartCardWidget extends StatefulWidget {
  final Map product;
  ReusableCartCardWidget(this.product);

  @override
  _ReusableCartCardWidgetState createState() =>
      _ReusableCartCardWidgetState(productMap: this.product);
}

class _ReusableCartCardWidgetState extends State<ReusableCartCardWidget> {
  Map productMap;
  int quantity = 1;
  _ReusableCartCardWidgetState({this.productMap});
  @override
  void initState() {
    super.initState();
    Cart cart = Provider.of<Cart>(context, listen: false);
    Timer(const Duration(milliseconds: 500), () {
      cart.totalPriceFunction(
          {productMap["_id"]: int.parse(productMap["price"]) * quantity},
          productMap["_id"]);
      cart.calculatingTheProfiteOfAdmins(productMap, quantity,
          int.parse(productMap["price"]) * quantity, productMap["_id"]);
    });
  }

  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    List images = productMap["images"];
    Map image = images[0];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                color: Color(0xFFE8E6FE),
                child: Image.network(image["url"]),
              ),
              Container(
                height: 110,
                child: Column(
                  children: <Widget>[
                    Text(
                      productMap["nameOfProduct"],
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "${int.parse(productMap["price"]) * quantity} \$",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                height: 110,
                child: Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.keyboard_arrow_up),
                        iconSize: 20,
                        onPressed: () {
                          setState(() {
                            quantity++;
                            cart.totalPriceFunction({
                              productMap["_id"]:
                                  int.parse(productMap["price"]) * quantity
                            }, productMap["_id"]);
                            cart.calculatingTheProfiteOfAdmins(
                                productMap,
                                quantity,
                                int.parse(productMap["price"]) * quantity,
                                productMap["_id"]);
                          });
                        }),
                    IconButton(
                        icon: Icon(Icons.keyboard_arrow_down),
                        iconSize: 20,
                        onPressed: () {
                          setState(() {
                            quantity--;
                            cart.totalPriceFunction({
                              productMap["_id"]:
                                  int.parse(productMap["price"]) * quantity
                            }, productMap["_id"]);
                            cart.calculatingTheProfiteOfAdmins(
                                productMap,
                                quantity,
                                int.parse(productMap["price"]) * quantity,
                                productMap["_id"]);
                          });
                        }),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  quantity.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              //  Container(
              //   margin: EdgeInsets.only(top: 40),
              //   child: Text(
              // cart.totalPrice.toString(),
              //     style: TextStyle(
              //         fontSize: 20
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

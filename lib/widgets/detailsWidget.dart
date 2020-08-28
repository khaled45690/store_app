import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/CartScreen.dart';

import 'CustomButton.dart';



class DetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productt = Provider.of<Product>(context,listen: false);
   final cart = Provider.of<Cart>(context,listen: false);
    return  CustomButton(
               
               text: "add to cart",
              fontSize: 15,onClick: (){
                  cart.addItem(productt.id, productt.price, productt.name, productt.imageUrl);
                  Navigator.of(context).pushNamed(CartWidget.routeName);

             },);
  }
}
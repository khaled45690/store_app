import 'package:flutter/material.dart';
import 'package:store_app/widgets/InputWidget.dart';
import 'package:store_app/widgets/appDrawer.dart';
import 'package:store_app/widgets/ReusableProductCardWidget.dart';

import 'CartScreen.dart';
class MainProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEAE8FF),
      appBar: AppBar(
        actions: <Widget>[
          InputWidget(),
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartWidget.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body:GridView.count(
          crossAxisCount: 2,
        childAspectRatio: (140 / 250),
          children: <Widget>[
            ReusableCardWidget(),
            ReusableCardWidget(),
            ReusableCardWidget(),
            ReusableCardWidget(),
            ReusableCardWidget(),
            ReusableCardWidget(),
            ReusableCardWidget(),
            ReusableCardWidget(),
            ReusableCardWidget(),
            ReusableCardWidget(),
            ReusableCardWidget(),
            ReusableCardWidget(),
          ],
      ),

    );
  }
}
//ReusableCardWidget(),
//AppBar(
//actions: <Widget>[
//AppDrawer(),
//],
//),

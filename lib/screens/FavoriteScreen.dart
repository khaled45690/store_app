import 'package:flutter/material.dart';
import 'package:store_app/widgets/ReusableProductCardWidget.dart';
import 'package:store_app/widgets/appBarContainer.dart';

import 'CartScreen.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/FavoriteScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAE8FF),
      appBar: AppBar(
        flexibleSpace: AppBarContainer(),
          title: Text("Favorite items"),
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
        //      Navigator.of(context).pushNamed(CartWidget.routeName);
            },
          ),
        ],
      ),

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

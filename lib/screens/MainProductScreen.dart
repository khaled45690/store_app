import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/MainProductModel.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/widgets/ReusableProductCardWidget.dart';
import 'package:store_app/widgets/cartConnection.dart';
import 'package:store_app/widgets/InputWidget.dart';
import 'package:store_app/widgets/appDrawer.dart';
import 'package:store_app/widgets/appBarContainer.dart';
import 'CartScreen.dart';
class MainProductScreen extends StatefulWidget {
  static const routeName = '/MainProductScreen';
  @override
  _MainProductScreenState createState() => _MainProductScreenState();
}

class _MainProductScreenState extends State<MainProductScreen> {
  List products = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MainProductModel mainProductModel = Provider.of<MainProductModel>(context, listen: false);
    mainProductModel.getMainProduct();
  }
  @override
  Widget build(BuildContext context) {
    MainProductModel mainProductModel = Provider.of<MainProductModel>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xFFEAE8FF),
      appBar:
      AppBar(
        flexibleSpace: AppBarContainer(),
        actions: <Widget>[
          InputWidget(),
          Consumer<Cart>(builder: (_,cart,ch)=>Badge(
            child: ch,
            value: cart.itemCount.toString(),
          ),
            child: IconButton(
              color: Colors.white,

              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartWidget.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body:
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          itemCount: mainProductModel.products.length,
          itemBuilder: (ctx, i) =>
              ReusableCardWidget(mainProductModel.products[i]),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (1 / 2),
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
        ),
      ),
    );
  }
}


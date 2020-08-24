import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/InputWidget.dart';
import 'package:store_app/widgets/ReusableCartCardWidget.dart';
import 'package:store_app/widgets/appDrawer.dart';
import 'package:store_app/widgets/ReusableProductCardWidget.dart';

import 'CartScreen.dart';
class MainProductScreen extends StatelessWidget {
      static const routeName = '/Main';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final product = productData.items;
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
        // itemCount: product.length,
        // itemBuilder: (ctx, i)=>  ReusableCartCardWidget(),
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2,
        //   childAspectRatio: (140/250),
        //   crossAxisSpacing: 10,
        //   mainAxisSpacing: 10,
        //   ),
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

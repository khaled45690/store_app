import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/favorite_model.dart';
import 'package:store_app/widgets/ReusableProductCardWidget.dart';
import 'package:store_app/widgets/ReusableProductFavoriteWidget.dart';
import 'package:store_app/widgets/appBarContainer.dart';
import 'package:store_app/widgets/cartConnection.dart';

import 'CartScreen.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/FavoriteScreen';
  @override
  Widget build(BuildContext context) {
    final favo = Provider.of<Favorite>(context);

    return Scaffold(
      backgroundColor: Color(0xFFEAE8FF),
      appBar: AppBar(
        flexibleSpace: AppBarContainer(),
          title: Text("Favorite items"),
        actions: <Widget>[
               Consumer<Cart>(builder: (_,cart,ch)=>Badge(
        child: ch,
       value: cart.itemCount.toString(),
            ),
            child: IconButton(
        color: Colors.black,
        
        icon: Icon(Icons.add_shopping_cart),
        onPressed: () {
            Navigator.of(context).pushNamed(CartWidget.routeName);
        },
       ),
            )   
        ],
      ),

      body:
   Stack(
                  children:[ Container(
              child:ListView.builder(
                itemCount:favo.items.length ,
                itemBuilder:(ctx, i)=> ResuableProductFavorite(
                  favo.items.values.toList()[i].id,
                  favo.items.values.toList()[i].price,
                  favo.items.values.toList()[i].quantity,
                  favo.items.values.toList()[i].name,
                  favo.items.values.toList()[i].imageUrl
                ),
              ),
                  ),
                  ],
        ),
    );
  }
}

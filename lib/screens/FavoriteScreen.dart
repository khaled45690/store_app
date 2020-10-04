import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/favorite_model.dart';
import 'package:store_app/widgets/ReusableProductCardWidget.dart';
import 'package:store_app/widgets/appBarContainer.dart';
import 'package:store_app/widgets/cartConnection.dart';

import 'CartScreen.dart';
class FavoriteScreen extends StatefulWidget {
  static const routeName = '/FavoriteScreen';
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}
int i;
class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();



  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Favorite favoriteModel = Provider.of<Favorite>(context);
    setState(() {
  i = favoriteModel.favorite.length;
    });
  }

  @override
  // void deactivate() {
  //   super.deactivate();
  //   Favorite favoriteModel = Provider.of<Favorite>(context , listen: false);
  //     favoriteModel.isTrue = true;
  //
  //
  // }
  Widget build(BuildContext context) {
    Favorite favoriteModel = Provider.of<Favorite>(context);
    return Scaffold(
      backgroundColor: Color(0xFFEAE8FF),
      appBar: AppBar(
        flexibleSpace: AppBarContainer(),
        title: Text("Favorite items"),
        actions: <Widget>[
          Consumer<Cart>(builder: (_,cart,ch)=>Badge(
            child: ch,
            value: cart.items.length.toString(),
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
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(

          itemCount: favoriteModel.favorite.length,
          itemBuilder:(BuildContext  ctx, i) {
            Favorite favoriteModel = Provider.of<Favorite>(ctx);
            final item =  favoriteModel.favorite[i];
            return ReusableCardWidget(item);
          },

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (1 / 2),

            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}


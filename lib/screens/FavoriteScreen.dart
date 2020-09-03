import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/models/MainProductModel.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/favorite_model.dart';
import 'package:store_app/widgets/ReusableProductCardWidget.dart';
import 'package:store_app/widgets/ReusableProductFavoriteWidget.dart';
import 'package:store_app/widgets/appBarContainer.dart';
import 'package:store_app/widgets/cartConnection.dart';

import 'CartScreen.dart';
class FavoriteScreen extends StatefulWidget {
  static const routeName = '/FavoriteScreen';
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List favorite = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _prefs.then((SharedPreferences prefs) {
      setState(() {
        favorite.addAll(jsonDecode(prefs.get("favorite")));
      });
    });

  }
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  void deactivate() {
    super.deactivate();
    Favorite favoriteModel = Provider.of<Favorite>(context , listen: false);
      favoriteModel.isTrue = true;

  }

//  void dispose() {
//    // TODO: implement dispose
//    super.dispose();
//    Favorite favoriteModel = Provider.of<Favorite>(context , listen: false);
//    favoriteModel.isTrue = true;
//
//  }
  @override
  Widget build(BuildContext context) {

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
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          itemCount: favorite.length,
          itemBuilder: (ctx, i) =>
              ReusableCardWidget(favorite[i]),
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


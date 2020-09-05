import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/models/MainProductModel.dart';
import 'package:store_app/models/cart.dart';
<<<<<<< Updated upstream
import 'package:store_app/models/favorite_model.dart';
=======
import 'package:store_app/models/product_model.dart';
>>>>>>> Stashed changes
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
    Timer(const Duration(milliseconds: 500), () {
      mainProductModel.printoo();
    });

  }
  @override
  Widget build(BuildContext context) {
    // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    //     _prefs.then((SharedPreferences prefs) {
  
    //   prefs.setString("favorite" , jsonEncode([]));

    // });
    MainProductModel mainProductModel = Provider.of<MainProductModel>(context);
<<<<<<< Updated upstream
    Favorite favoriteModel = Provider.of<Favorite>(context);
    if( favoriteModel.isTrue){
      Timer(const Duration(milliseconds: 50), () {
        Navigator.of(context).pushReplacementNamed(MainProductScreen.routeName);
      });
=======
    Products products = Provider.of<Products>(context);
>>>>>>> Stashed changes

      print("entered");
      favoriteModel.isTrue = false;
    }
    return Scaffold(
      backgroundColor: Color(0xFFEAE8FF),
      appBar:
      AppBar(
        flexibleSpace: AppBarContainer(),
        actions: <Widget>[
          InputWidget(),
          Consumer<Cart>(builder: (_,cart,ch)=>Badge(
            child: ch,
            value: cart.items.length.toString(),
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


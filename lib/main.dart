import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/CartScreen.dart';
import 'package:store_app/screens/FavoriteScreen.dart';
import 'package:store_app/screens/MainProductScreen.dart';
import 'package:store_app/screens/SignUpScreen.dart';
import 'package:store_app/screens/loginScreen.dart';
void main() =>
  runApp(StoreApp());


class StoreApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (ctx) => Products(),
          child: MaterialApp(
            title: "StoreApp",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainProductScreen(),
        routes: {
          CartWidget.routeName: (ctx) => CartWidget(),
          FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignUp.routeName:(ctx) => SignUp(),
          MainProductScreen.routeName:(ctx) =>MainProductScreen()
        },
      ),
    );
  }
}

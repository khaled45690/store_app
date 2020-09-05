import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/viewmodels/home_model.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/CartScreen.dart';
import 'package:store_app/screens/FavoriteScreen.dart';
import 'package:store_app/screens/MainProductScreen.dart';
import 'package:store_app/screens/SignUpNew.dart';
import 'package:store_app/screens/SignUpScreen.dart';
import 'package:store_app/screens/amdin/EditProduct.dart';
import 'package:store_app/screens/amdin/addProduct.dart';
import 'package:store_app/screens/LoginNew.dart';
import 'package:store_app/screens/loginScreen.dart';
import 'package:store_app/screens/productDetails.dart';
import 'package:store_app/models/producttt.dart';
import 'package:store_app/widgets/spalshScreenWidget.dart';
import 'models/UserData.dart';
import 'models/MainProductModel.dart';
import 'models/favorite_model.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Cart()),
          ChangeNotifierProvider(create: (_) => Products()),
          ChangeNotifierProvider(create: (_) => MainProductModel()),
          ChangeNotifierProvider(create: (_) => UserData()),
          ChangeNotifierProvider(create: (_) => Product()),
          ChangeNotifierProvider(create: (_)=>Favorite(),),
          ChangeNotifierProvider(create: (_)=>HomeModel(),),

        ],
        child: StoreApp(),
      ),
    );

class StoreApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,

      title: "StoreApp",
      theme: ThemeData(
        primaryColor: Color(0xFFEAE8FF),
      ),
      home:     LoginPage(),

      routes: {
        CartWidget.routeName: (ctx) => CartWidget(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignUp.routeName: (ctx) => SignUp(),
        MainProductScreen.routeName: (ctx) => MainProductScreen(),
        ProductDetails.routeName: (ctx) => ProductDetails(),
        AdminAddProduct.routeName: (ctx) => AdminAddProduct(),
        AdminEditProduct.routeName: (ctx) => AdminEditProduct(),
        FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
        LoginPage.routeName:(ctx)=>LoginPage(),
        SignUpNew.routeName:(ctx) =>SignUpNew()
      },
    );
  }
}

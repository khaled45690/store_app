import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:store_app/core/viewmodels/home_model.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/CartScreen.dart';
import 'package:store_app/screens/Deals_screen.dart';
import 'package:store_app/screens/FavoriteScreen.dart';
import 'package:store_app/screens/MainProductScreen.dart';
import 'package:store_app/screens/SignUpNew.dart';
import 'package:store_app/screens/SignUpScreen.dart';
import 'package:store_app/screens/amdin/AddItem.dart';
import 'package:store_app/screens/amdin/EditProduct.dart';
import 'package:store_app/screens/amdin/ShowProduct.dart';
import 'package:store_app/screens/LoginNew.dart';
import 'package:store_app/screens/loginScreen.dart';
import 'package:store_app/screens/productDetails.dart';
import 'package:store_app/models/producttt.dart';
import 'package:store_app/shared/globals.dart';
import 'package:store_app/widgets/spalshScreenWidget.dart';
import 'models/UserData.dart';
import 'models/MainProductModel.dart';
import 'models/favorite_model.dart';
import 'screens/amdin/neumorphic_expenses/monthly_expenses_view.dart';

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
        primaryColor: Global.mediumBlue,
        //Color(0xFFEAE8FF),
      ),


      home:     SpashScreenWidget(),


      routes: {
        MainProductScreen.routeName: (ctx) => MainProductScreen(),
        CartWidget.routeName: (ctx) => CartWidget(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignUp.routeName: (ctx) => SignUp(),
        ProductDetails.routeName: (ctx) => ProductDetails(),
        ShowProducts.routeName: (ctx) => ShowProducts(),
        AdminEditProduct.routeName: (ctx) => AdminEditProduct(),
        FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
        LoginPage.routeName:(ctx)=>LoginPage(),
        SignUpNew.routeName:(ctx) =>SignUpNew(),
        AddItem.routeName:(ctx) => AddItem(),
        DealsScreen.routeName:(ctx)=>DealsScreen(),
        MontlyExpensesView.routeName:(ctx)=>MontlyExpensesView(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:store_app/screens/CartWidget.dart';
import 'package:store_app/screens/MainProductScreen.dart';
void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainProductScreen(),
      routes: {
        CartWidget.routeName: (ctx) => CartWidget(),
      },
    );
  }
}

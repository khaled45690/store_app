import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    );
  }
}

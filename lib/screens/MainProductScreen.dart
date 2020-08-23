import 'package:flutter/material.dart';
import 'package:store_app/widgets/appDrawer.dart';
import 'package:store_app/widgets/ReusableCardWidget.dart';
class MainProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF0EEFF),
      appBar: AppBar(
        title: Text("appbar"),
      ),
      drawer: AppDrawer(),
      body:GridView.count(
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
            FloatingActionButton(
              onPressed: ()=>{
                print("ss")
              },
            ),
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

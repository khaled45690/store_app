import 'package:flutter/material.dart';
import 'package:store_app/screens/MainProductScreen.dart';

class DealsScreen extends StatelessWidget {
    static const routeName = '/Deals_Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Today's Deals")
      ),
      body: Container(
        padding: EdgeInsets.only(top:250,left: 100),
        child: FlatButton(
          child: Text("There's no deals Today",style: TextStyle(fontSize:20),),
          onPressed: (){
           Navigator.of(context).pushNamed(
              MainProductScreen.routeName,
              
            );
          },
          
        ),
      ),
      
    );
  }
}
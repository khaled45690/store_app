import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/ReusableCartCardWidget.dart';
import 'package:store_app/widgets/appBarContainer.dart';

class CartWidget extends StatelessWidget {
  static const routeName = '/CartWidget';
  @override
  Widget build(BuildContext context) {
       final cart = Provider.of<Cart>(context);

    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F3FF),
        appBar: AppBar(
          flexibleSpace: AppBarContainer(),
          title: Text("Cart Screen"),
        ),
        body: Container(
            child:ListView.builder(
              itemCount:cart.items.length ,
              itemBuilder:(ctx, i)=> ReusableCartCardWidget(
                cart.items.values.toList()[i].id,
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].name,
                cart.items.values.toList()[i].imageUrl

              ),



       
            ),
        ),
      ),
    );
  }
}












   //     // crossAxisCount: 1,
          //     // childAspectRatio: (140 / 45),
          //     // children: <Widget>[
          // //      ReusableCartCardWidget(),

          //       // Padding(
          //       //   padding: EdgeInsets.only(top: 40 , left: 100 , right: 100 ,bottom: 40),
          //       //   child: CustomButton(text: "purchase products", fontSize: 20,),
          //       // ),
          //   //  ],
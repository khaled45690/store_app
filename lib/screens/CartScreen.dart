import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/models/UserData.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/shared/globals.dart';
import 'package:store_app/widgets/ReusableCartCardWidget.dart';
import 'package:store_app/widgets/appBarContainer.dart';

import 'LoginNew.dart';

class CartWidget extends StatelessWidget {
  static const routeName = '/CartWidget';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F3FF),
        appBar: AppBar(
          backgroundColor: Global.mediumBlue,
          flexibleSpace: AppBarContainer(),
          title: Text("Cart Screen"),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 100),
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => ReusableCartCardWidget(cart.items[i]),
              ),

            ),
            // SizedBox(height:1),
            Card(
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ListTile(
                  leading: Text(
                    "Sub Total: ${cart.totalPrice} \$",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  trailing: Container(
                    width: 100,
                    height: 150,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: FlatButton(
                        onPressed: () {
                          final UserData userData =
                              Provider.of<UserData>(context, listen: false);
                          if (userData.userData == null) {
                            return showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      content:
                                          Text('you have to sign in first'),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .popAndPushNamed(
                                                    LoginPage.routeName);
                                          },
                                          child: Text("Sign in"),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Cancel"))
                                      ],
                                    ));
                          } else {
                            return showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      content: Text(
                                          'do u want to pay via credit card'),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () async{
                                             await http.post(
                                                "${kUrl}purchaseApi",
                                                headers: <String, String>{
                                                  'Content-Type': 'application/json; charset=UTF-8',
                                                },
                                                body: jsonEncode(cart.itemsUsedInProfitCalculation)
                                            );

                                            Navigator.of(context).pop(true);
                                          },
                                          child: Text("yes"),
                                        ),
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Cancel"))
                                      ],
                                    ));
                          }
                        },
                        child: Text(
                          "buy it ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //    child: Text("dsad")
            ),
            //  )
          ],
        ),
      ),
    );
  }
}

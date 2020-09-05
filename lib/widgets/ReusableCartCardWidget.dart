import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/models/producttt.dart';
class ReusableCartCardWidget extends StatefulWidget {
     
   Map product;
  ReusableCartCardWidget(this.product);

  @override
  _ReusableCartCardWidgetState createState() => _ReusableCartCardWidgetState(productMap : this.product);
}

class _ReusableCartCardWidgetState extends State<ReusableCartCardWidget> {
  Map productMap;
   _ReusableCartCardWidgetState({this.productMap});
  @override
  Widget build(BuildContext context) {
         //  final cart = Provider.of<Cart>(context);
         final product = Provider.of<Product>(context,listen: false);
   final cart = Provider.of<Cart>(context,listen: false);
List images = productMap["images"];
int quantity = 1;
print(images);
    return  Card(
          child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                color: Color(0xFFE8E6FE),
                  
                  child:
                
                Image.network(
                (
      "${kUrl}getImage/${jsonDecode(images[0])}"
               
                  ),
                )
                ),
                Container(
                  height: 110,
                  child: Column(
                    children: <Widget>[
                      Text(
                  productMap["nameOfProduct"],
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 50,),
                      Text(
                      productMap["price"]*quantity,
                      //  '\$${widget.price.toString()}',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 110,
                  child: Column(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.keyboard_arrow_up), iconSize: 20 , onPressed: (){
                        setState(() {
                          quantity ++;
                              cart.totalPriceFunction(productMap["price"]*quantity);
                        });
                    
                       
                      }),
                      IconButton(icon: Icon(Icons.keyboard_arrow_down),iconSize: 20, onPressed: (){
                       // cart.subtract;
                         
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                  //  quantity.toString(),
                //  ('${widget.quantity} number'),
                 quantity.toString(),
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ),
                //  Container(
                //   margin: EdgeInsets.only(top: 40),
                //   child: Text(
                // cart.totalAmout.toString(),
                //   //  quantity.toString(),
                // //  ('${widget.quantity} number'),
                
                //     style: TextStyle(
                //         fontSize: 20
                //     ),
                //   ),
                // ),
               
              ],
            ),
            
          ),
          
          
        ),
    );
      

    
  }



}



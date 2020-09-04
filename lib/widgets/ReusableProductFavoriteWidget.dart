import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/favorite_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/models/producttt.dart';
import 'package:store_app/screens/CartScreen.dart';

import 'CustomButton.dart';
class ResuableProductFavorite extends StatefulWidget {
     String id;
   double price;
  int quantity;
   String name;
   String imageUrl;
  ResuableProductFavorite(this.id,this.price,this.quantity,this.name,this.imageUrl);

  @override
  _ResuableProductFavoriteState createState() => _ResuableProductFavoriteState();
}

class _ResuableProductFavoriteState extends State<ResuableProductFavorite> {
  @override
  Widget build(BuildContext context) {
         //  final cart = Provider.of<Cart>(context);
         final product = Provider.of<Product>(context,listen: false);
   final cart = Provider.of<Cart>(context,listen: false);
    final favo = Provider.of<Favorite>(context);


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
                  widget.imageUrl
               
                  ),
                )
                ),
                Container(
                  height: 110,
                  child: Column(
                    children: <Widget>[
                      Text(
                      //  't-shirt',
                          widget.name,
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 50,),
                      Text(
                      
                    
                        '\$${widget.price.toString()}',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 90,top:50,bottom: 5),
                  height: 110,
                  child: Column(
                    children: <Widget>[
                //     IconButton(icon: Icon(Icons.add_shopping_cart), iconSize: 20 , onPressed: (){
                     //  cart.add;
                      
                  //   }),
                   CustomButton(
          text: "add to cart",
          fontSize: 15,
          onClick: () {
//            cart.addItem(
//             widget.id, widget.price,
//                widget.name, widget.imageUrl,
//                widget.quantity);

            Navigator.of(context).pushNamed(
              CartWidget.routeName,
            );
          },
        ),
                     
                    ],
                  ),
                ),
        
               
              ],
            ),
            
          ),
          
          
        ),
    );
      

    
  }

  void subtract()
  {
    if(widget.quantity >= 0)
    {
    setState(() {
            widget.quantity = widget.quantity - 1;

        });

    }
  }

  void add(){

    if(widget.quantity >= 0){
      setState(() {
        widget.quantity = widget.quantity +1;
      });
    }

  }
}



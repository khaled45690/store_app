import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/favorite_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/models/producttt.dart';
import 'package:store_app/screens/CartScreen.dart';

import 'CustomButton.dart';
class ResuableProductFavorite extends StatefulWidget {
  //    String id;
  //  double price;
  // int quantity;
  //  String name;
  //  String imageUrl;
     final Map product;

  ResuableProductFavorite(this.product);

  @override
  _ResuableProductFavoriteState createState() => _ResuableProductFavoriteState(productMap : product);
}

class _ResuableProductFavoriteState extends State<ResuableProductFavorite> {
  List favorite = [];
  bool isFavorite = false;
   Map productMap;
   _ResuableProductFavoriteState({this.productMap});
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();
    _prefs.then((SharedPreferences prefs) {
      setState(() {
        favorite.addAll(jsonDecode(prefs.get("favorite")));
        isFavorite = favorite.any((element) => element["_id"] == productMap["_id"]);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
         //  final cart = Provider.of<Cart>(context);
         Cart cart = Provider.of<Cart>(context);
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    List images = productMap["images"];
    print("$kUrl${jsonDecode(images[0])}");

    void addAndRemoveFavoriteItems() {
      if(isFavorite){
        setState(() {
          isFavorite = false;
        });

        _prefs.then((SharedPreferences prefs) {
          favorite = jsonDecode(prefs.get("favorite"));
          List filter = [];
          favorite.forEach((e) => {
            print(e["_id"] == productMap["_id"]),
            if(e["_id"] == productMap["_id"]){
                  
            }else{
              filter.add(e)
            }
          });
          print(filter);
          prefs.setString("favorite" , jsonEncode(filter));
        });
        print(favorite);
      }else{
        _prefs.then((SharedPreferences prefs) {
          favorite = jsonDecode(prefs.get("favorite"));
          favorite.add(productMap);
          prefs.setString("favorite" , jsonEncode(favorite));
        });
        setState(() {
          isFavorite = true;
        });

      }
    }

  //        final product = Provider.of<Product>(context,listen: false);
  //  final cart = Provider.of<Cart>(context,listen: false);
  //   final favo = Provider.of<Favorite>(context);


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
                 // widget.imageUrl
               
                  ),
                )
                ),
                Container(
                  height: 110,
                  child: Column(
                    children: <Widget>[
                      Text(
                      //  't-shirt',
                       //   widget.name,
                        productMap["nameOfProduct"],
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 50,),
                      Text(
                      
                                      "${ productMap["price"]} \$",

                      //  '\$${widget.price.toString()}',
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


}



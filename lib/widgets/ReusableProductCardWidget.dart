import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/favorite_model.dart';
import 'package:store_app/screens/productDetails.dart';
import 'CustomButton.dart';
class ReusableCardWidget extends StatefulWidget {
   final Map product;

   ReusableCardWidget(this.product);
  @override
  _ReusableCardWidgetState createState() => _ReusableCardWidgetState(productMap : product);
}

class _ReusableCardWidgetState extends State<ReusableCardWidget> {
List favorite = [];
  bool isFavorite = false;
   Map productMap;
   _ReusableCardWidgetState({this.productMap});

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

    return InkWell(
      onTap: (){
         Navigator.of(context).pushNamed(
            ProductDetails.routeName,
            arguments: productMap["_id"]
          );
      } ,
          child: Container(
        padding: EdgeInsets.only(bottom:10),
        margin: EdgeInsets.all(3),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 140,
                    height: 200,
                    margin: EdgeInsets.only(top: 10),
                    child: Image.network("${kUrl}getImage/${jsonDecode(images[0])}"),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    productMap["nameOfProduct"],
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 18,

                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                  //  '\$${widget.price.toString()}',
                  "${ productMap["price"]} \$",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 18,

                    ),
                  ),
                  SizedBox(height: 20.0),
                  CustomButton(
                    text: "add to cart",
                    fontSize: 15,
                    onClick: (){},),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.only(bottom: 280 , top: 20),
                  color: Colors.red,
                  icon:  isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                  onPressed: () {
                    addAndRemoveFavoriteItems();
                  },
                ),
                IconButton(
                  color: Colors.black,
                  icon: Icon(
                    
                    Icons.add_shopping_cart),
                  onPressed: () {
                    cart.addItemToCart(productMap);
                    Scaffold.of(context).hideCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(
                 SnackBar(
                 content: Text('Added  ${ productMap["nameOfProduct"]} to cart',textAlign:  TextAlign.center,),
               duration: Duration(seconds: 2),
               //action: 
             //  SnackBarAction(label: "UNDO", onPressed: (){cart.removeSingleItem(product.id);}
              // )
               ));
                    
                    },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  }



















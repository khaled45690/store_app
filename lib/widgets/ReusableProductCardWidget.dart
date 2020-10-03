import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/favorite_model.dart';
import 'package:store_app/models/screenSizeModel.dart';
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
      if( prefs.get("favorite") == null ){
        prefs.setString("favorite" , jsonEncode([]));
      } else{
      setState(() {
      favorite.addAll(jsonDecode(prefs.get("favorite")));
      isFavorite = favorite.any((element) => element["_id"] == productMap["_id"]);
      });
      }

    });

  }


  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    ScreenSize screenSize = Provider.of<ScreenSize>(context);
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    List images = productMap["images"];
    Map image = images[0];
    String imageUrl = image["url"];

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
            width: 800,
        padding: EdgeInsets.only(bottom:10,),
    //    margin: EdgeInsets.all(0),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
           // padding: EdgeInsets.only(right: 1),

              width: screenSize.productContainerWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: screenSize.productContainerWidth,
                 //   margin: EdgeInsets.only(top: 10,),
                    child: Image.network(imageUrl),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    productMap["nameOfProduct"],
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: screenSize.fontSize,

                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                  //  '\$${widget.price.toString()}',
                  "${ productMap["price"]} \$",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: screenSize.fontSize,

                    ),
                  ),
                  SizedBox(height: 20.0),
                  CustomButton(
                    text: "add to cart",
                    fontSize: screenSize.fontSize,
                    onClick: (){},),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.only(bottom: screenSize.favoriteIconBottomPadding ,right: 0 ,left: 0 ,top: screenSize.favoriteIconTopPadding),
                  color: Colors.red,
                  icon:  isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                  onPressed: () {
                    addAndRemoveFavoriteItems();
                  },
                ),
                IconButton(
                padding: EdgeInsets.only(right: 5),

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



















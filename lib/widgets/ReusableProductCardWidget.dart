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
  _ReusableCardWidgetState createState() =>
      _ReusableCardWidgetState();
}

class _ReusableCardWidgetState extends State<ReusableCardWidget> {
  bool isFavorite = false;
  _ReusableCardWidgetState();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Favorite favoriteModel = Provider.of<Favorite>(context);
    _prefs.then((SharedPreferences prefs) {
      if (prefs.get("favorite") == null) {
        prefs.setString("favorite", jsonEncode([]));
      } else {
        List favorite = List();
        favorite.addAll(jsonDecode(prefs.get("favorite")));
        favoriteModel.favorite = favorite;

          setState(() {
            isFavorite =
                favoriteModel.favorite.any((element) => element["_id"] == widget.product["_id"]);
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Favorite favoriteModel = Provider.of<Favorite>(context);
    Cart cart = Provider.of<Cart>(context);
    ScreenSize screenSize = Provider.of<ScreenSize>(context);
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    List images = widget.product["images"];
    Map image = images[0];
    String imageUrl = image["url"];


    void addAndRemoveFavoriteItems() {
      if (isFavorite) {
        setState(() {
          isFavorite = false;
        });

        _prefs.then((SharedPreferences prefs) {
          List filter = [];
          favoriteModel.favorite.forEach((e) => {

                if (e["_id"] == widget.product["_id"]) {
                } else {filter.add(e)}
              });
          prefs.setString("favorite", jsonEncode(filter));
          favoriteModel.favorite = filter;
        });
      } else {
        _prefs.then((SharedPreferences prefs) {
          List favorite = jsonDecode(prefs.get("favorite"));
          favorite.add(widget.product);
          // favoriteModel.favorite = favorite;
          prefs.setString("favorite", jsonEncode(favorite));
        });
        setState(() {
          isFavorite = true;
        });
      }
    }

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetails.routeName, arguments: widget.product["_id"]);
      },
      child: Container(
        width: 800,
        padding: EdgeInsets.only(
          bottom: 10,
        ),
        //    margin: EdgeInsets.all(0),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              // padding: EdgeInsets.only(right: 1),

              // width: screenSize.productContainerWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 170,
                    height: 150,
                    //   margin: EdgeInsets.only(top: 10,),
                    child: Image.network(imageUrl),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    widget.product["nameOfProduct"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.fontSize,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    //  '\$${widget.price.toString()}',
                    "${widget.product["price"]} \$",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.fontSize,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                    IconButton(
                      padding: EdgeInsets.only(
                          right: 60,
                          left: 0,
                      ),
                      color: Colors.red,
                      icon: isFavorite
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      onPressed: () {
                        addAndRemoveFavoriteItems();
                      },
                    ),
                    IconButton(
                      padding: EdgeInsets.only(left: 20),
                      color: Colors.black,
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        cart.addItemToCart(widget.product);
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Added  ${widget.product["nameOfProduct"]} to cart',
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 2),
                          //action:
                          //  SnackBarAction(label: "UNDO", onPressed: (){cart.removeSingleItem(product.id);}
                          // )
                        ));
                      },
                    ),
                  ],)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

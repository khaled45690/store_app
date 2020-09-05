import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/favorite_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/models/producttt.dart';
import 'package:store_app/screens/productDetails.dart';
class ProductWidget extends StatefulWidget {
  final Map product;

   ProductWidget(this.product);
  // final String id;
  // final String name;
  // final String imageUrl;
  // ProductWidget(this.id,this.name,this.imageUrl);

  @override
  _ProductWidgetState createState() => _ProductWidgetState(productMap : product);
}

class _ProductWidgetState extends State<ProductWidget> {
  List favorite = [];
  bool isFavorite = false;
   Map productMap;
      _ProductWidgetState({this.productMap});

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
   final product = Provider.of<Product>(context,listen: false);
   //final cart = Provider.of<Cart>(context,listen: false);
   final favo =Provider.of<Favorite>(context,listen: false);
   print('object');
    return GridTile(
      
      
      child: GestureDetector(
        

        onTap: (){
          Navigator.of(context).pushNamed(
            ProductDetails.routeName,
            arguments: product.id
          );
        }
      ,
      
      child: Image.network(
      //    product.imageUrl,
      "${kUrl}getImage/${jsonDecode(images[0])}",
      fit:BoxFit.contain
      ),
      
      ),
      
      footer: GridTileBar(
        
        
        backgroundColor: Colors.white24,
        leading: Consumer<Product> (
         builder:(ctx, product,_) => 
         product.isFavorite ?
         IconButton(
          icon: Icon(
             Icons.favorite
            ),
         color: Colors.red,
          onPressed: (){
         //   favo.removeSingleItem(product.id,);
           // product.toggleFavoritesStatus();
                addAndRemoveFavoriteItems();

          },
         ) 
         : IconButton(
          icon: Icon(
             Icons.favorite_border 
             
            ),
          color: Colors.white,
          onPressed: (){
//            favo.addItem(product.id, product.price, product.name, product.imageUrl);
     //       product.toggleFavoritesStatus();
     addAndRemoveFavoriteItems();
          },
         ) 
         ),
        
        title: Container(
          width: 50,
      //    height: MediaQuery.of(context).size.height,

          child: Text(
            //product.name,
                              productMap["nameOfProduct"],

          textAlign: TextAlign.center,
            style: TextStyle(color:Colors.black,fontSize:15),
          ),
        ),
  
            trailing: IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.black, ),


             onPressed: (){
//             cart.addItem(product.id, product.price, product.name, product.imageUrl,product.quantity);
                  cart.addItemToCart(productMap);

             Scaffold.of(context).hideCurrentSnackBar();
             Scaffold.of(context).showSnackBar(
               SnackBar(
               content: Text('Added ${ productMap["nameOfProduct"]} to cart',textAlign:  TextAlign.center,),
             duration: Duration(seconds: 2),
             //action: 
           //  SnackBarAction(label: "UNDO", onPressed: (){cart.removeSingleItem(product.id);}
            // )
             )
             );
             
             }
             ),


            subtitle:Text(
                "${ productMap["price"]} \$",
              //'\$${product.price.toString()}'
            style: TextStyle(color:Colors.black,fontSize:15),),


        // onPressed: (){

        // },
       // ),
        ),
    );
  }
}
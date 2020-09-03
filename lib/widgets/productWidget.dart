import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/favorite_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/models/producttt.dart';
import 'package:store_app/screens/productDetails.dart';
class ProductWidget extends StatelessWidget {
  // final String id;
  // final String name;
  // final String imageUrl;
  // ProductWidget(this.id,this.name,this.imageUrl);

  @override
  Widget build(BuildContext context) {
   final product = Provider.of<Product>(context,listen: false);
   final cart = Provider.of<Cart>(context,listen: false);
   final favo =Provider.of<Favorite>(context,listen: false);
   print('object');
    return GridTile(
      child: Container(
              width: MediaQuery.of(context).size.width,

        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(
              ProductDetails.routeName,
              arguments: product.id
            );
          }
        ,
        child: Image.network(
          product.imageUrl,
        fit:BoxFit.cover
        )
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
            favo.removeSingleItem(product.id,);
            product.toggleFavoritesStatus();
          },
         ) 
         : IconButton(
          icon: Icon(
             Icons.favorite_border 
             
            ),
          color: Colors.white,
          onPressed: (){
//            favo.addItem(product.id, product.price, product.name, product.imageUrl);
            product.toggleFavoritesStatus();
          },
         ) 
         ),
        
        title: Container(
          width: 50,
      //    height: MediaQuery.of(context).size.height,

          child: Text(product.name,
          textAlign: TextAlign.center,
            style: TextStyle(color:Colors.black,fontSize:15),
          ),
        ),
  
            trailing: IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.black, ),


             onPressed: (){
             cart.addItem(product.id, product.price, product.name, product.imageUrl,product.quantity);
             Scaffold.of(context).hideCurrentSnackBar();
             Scaffold.of(context).showSnackBar(
               SnackBar(
               content: Text('Added ${product.name} to cart',textAlign:  TextAlign.center,),
             duration: Duration(seconds: 2),
             //action: 
           //  SnackBarAction(label: "UNDO", onPressed: (){cart.removeSingleItem(product.id);}
            // )
             )
             );
             
             }
             ),


            subtitle:Text('\$${product.price.toString()}',style: TextStyle(color:Colors.black,fontSize:15),),


        // onPressed: (){

        // },
       // ),
        ),
    );
  }
}
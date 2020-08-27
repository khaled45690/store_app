import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/productDetails.dart';
class ProductWidget extends StatelessWidget {
  // final String id;
  // final String name;
  // final String imageUrl;
  // ProductWidget(this.id,this.name,this.imageUrl);

  @override
  Widget build(BuildContext context) {
   final product = Provider.of<Product>(context,listen: false);
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
      child: Image.network(product.imageUrl,
      fit:BoxFit.cover
      )
      ),
      footer: GridTileBar(
        backgroundColor: Colors.white24,
        leading: Consumer<Product> (
         builder:(ctx, product,_) => IconButton(
          icon: Icon(
            product.isFavorite ? Icons.favorite :Icons.favorite_border
            ),
          color: Colors.redAccent,
          onPressed: (){
            product.toggleFavoritesStatus();
          },
         ) 
         ),
        
        title: Text(product.name,
        textAlign: TextAlign.center,style: TextStyle(color:Colors.black,fontSize:20),
        ),
      // trailing: IconButton(icon: Icon(Icons.shopping_cart),
            trailing: IconButton(icon: Icon(Icons.shopping_cart,color: Colors.black, ),
       //     color: Colors.black,

             onPressed: null),
  //    '\$${loadedProduct.price}',

            subtitle:Text('\$${product.price.toString()}',style: TextStyle(color:Colors.black,fontSize:20),),


        // onPressed: (){

        // },
       // ),
        ),
    );
  }
}
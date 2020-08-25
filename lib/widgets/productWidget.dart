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
   final product = Provider.of<Product>(context);
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
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(product.isFavorite? Icons.favorite :Icons.favorite_border),
          color: Colors.blue,
          onPressed: (){
            product.toggleFavoritesStatus();
          },
        ),
        title: Text(product.name,
        textAlign: TextAlign.center,
        ),
      // trailing: IconButton(icon: Icon(Icons.shopping_cart),
            trailing: Text(product.price.toString()),

        // onPressed: (){

        // },
       // ),
        ),
    );
  }
}
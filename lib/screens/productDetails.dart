import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/CustomButton.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/Product-details';


  @override
  Widget build(BuildContext context) {
       final productId = ModalRoute.of(context).settings.arguments as String;
      //  final product = Provider.of<Product>(context);
   final loadedProduct =   Provider.of<Products>(context).items.firstWhere((prod) => prod.id ==productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.name)
      ),
      body: ListView(
        children:<Widget>[
          Container(
            height: 300,
            width: double.infinity,

            child:Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.cover,
            ) ,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:10),
              child: Text(
        
                '\$${loadedProduct.price}',
                 textAlign:TextAlign.center,
                style: TextStyle(
                  color:Colors.grey,
                  fontSize:20,
                  
                ),
              ),
            ),
            SizedBox(height:10),
            Container(
              padding: EdgeInsets.symmetric(horizontal:10),
              child: Text(loadedProduct.description, textAlign:TextAlign.center,
              ),
           
       
            ),
                        SizedBox(height: 60.0),
             CustomButton(text: "add to cart", fontSize: 15,),
        ]
      ),
      
    );
  }
}
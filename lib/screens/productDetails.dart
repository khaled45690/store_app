import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/appBarContainer.dart';
import 'package:store_app/widgets/detailsWidget.dart';

import 'CartScreen.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/Product-details';


  @override
  Widget build(BuildContext context) {
   final productId = ModalRoute.of(context).settings.arguments as String;
   final loadedProduct =   Provider.of<Products>(context).findbyId(productId);
   //firstWhere((prod) => prod.id ==productId);

    return Scaffold(
      appBar: AppBar(

        title: Text(loadedProduct.name),
        flexibleSpace: AppBarContainer(),
        
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
                  color:Colors.black,
                  fontSize:24,
                  fontWeight: FontWeight.bold
                  
                  
                ),
              ),
            ),
            SizedBox(height:10),
            Container(
              padding: EdgeInsets.symmetric(horizontal:10),
              child: Text(loadedProduct.description,
              style: TextStyle(
                color:Colors.black,
                fontSize: 18  
              
              ), textAlign:TextAlign.center,
              ),
           
       
            ),
                        SizedBox(height: 60.0),
                     //  DetailsWidget()
             CustomButton(
               
               text: "add to cart",
              fontSize: 15,onClick: (){
                  Navigator.of(context).pushNamed(CartWidget.routeName);

             },),
        ]
      ),
      
    );
  }
}
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
class Product  extends ChangeNotifier{
 final String id;
 final String name;
 final double price;
 final String description;
       String imageUrl;
 final String category;
 final int quantity;
  bool isFavorite;
  Product(
      { 
      @required  this.id,
      @required   this.name, 
      @required   this.price,
      @required   this.description,
      @required   this.imageUrl,
      @required   this.category,
      @required   this.quantity,
      this.isFavorite =true
 
      });
      void toggleFavoritesStatus(){
        isFavorite =!isFavorite;
        notifyListeners();
      
      }
}
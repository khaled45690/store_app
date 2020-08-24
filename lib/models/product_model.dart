import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class Product {
  String id;
  String name;
  double price;
  String description;
  String imageUrl;
  String category;
  int quantity;
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
      @required   this.isFavorite
 
      });
}
class Products with ChangeNotifier{
  List<Product> _items =[
  Product(
    id:'p1',
    name:'t-shirt',
    price: 55,
    description: 'gamed fash5',
    imageUrl: "https://specs1.com/wp-content/uploads/2018/10/HUAWEI-Mate-20-Pro-600x600.jpg",
    category: "not now",
    quantity: 2,
    isFavorite: true
  ),
   Product(
    id:'p2',
    name:'t-shirt',
    price: 55,
    description: 'gamed fash5',
    imageUrl: "https://specs1.com/wp-content/uploads/2018/10/HUAWEI-Mate-20-Pro-600x600.jpg",
    category: "not now",
    quantity: 2,
    isFavorite: true
  ), Product(
    id:'p3',
    name:'t-shirt',
    price: 55,
    description: 'gamed fash5',
    imageUrl: "https://specs1.com/wp-content/uploads/2018/10/HUAWEI-Mate-20-Pro-600x600.jpg",
    category: "not now",
    quantity: 2,
    isFavorite: true
  ), Product(
    id:'p4',
    name:'t-shirt',
    price: 55,
    description: 'gamed fash5',
    imageUrl: "https://specs1.com/wp-content/uploads/2018/10/HUAWEI-Mate-20-Pro-600x600.jpg",
    category: "not now",
    quantity: 2,
    isFavorite: true
  ),
   Product(
    id:'p5',
    name:'t-shirt',
    price: 55,
    description: 'gamed fash5',
    imageUrl: "https://specs1.com/wp-content/uploads/2018/10/HUAWEI-Mate-20-Pro-600x600.jpg",
    category: "not now",
    quantity: 2,
    isFavorite: true
  ),



  ];

  List<Product> get items{
    return [..._items];
  }
  void addProduct(){
    //_items.add(value);
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class Product  with ChangeNotifier{
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
         this.isFavorite =false
 
      });
      void toggleFavoritesStatus(){
        isFavorite =!isFavorite;
        notifyListeners();
      
      }
}
class Products with ChangeNotifier{
  List<Product> _items =[
  Product(
    id:'p1',
    name:'t-shirt',
    price: 30,
    description: ' t-shirt a7mr gamed gamed fe mno alwan kter',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/24/Blue_Tshirt.jpg',
    category: "not now",
    quantity: 2,
    isFavorite: true
  ),
   Product(
    id:'p2',
    name:'shoes',
    price: 120,
    description: 'gamed fash5',
    imageUrl: "https://images-na.ssl-images-amazon.com/images/I/61Ez19M9BZL._AC_UY1000_.jpg",
    category: "not now",
    quantity: 2,
    isFavorite: true
  ), Product(
    id:'p4',
    name:'phone',
    price: 55,
    description: 'phone fshe5 wla ram :32  gb:1000gb',
    imageUrl: "https://specs1.com/wp-content/uploads/2018/10/HUAWEI-Mate-20-Pro-600x600.jpg",
    category: "not now",
    quantity: 2,
  //  isFavorite: false
  ),
   Product(
    id:'p5',
    name:'kora',
    price: 75,
    description: 'kora mdwara',
    imageUrl: "https://images.all-free-download.com/images/graphiclarge/ecommerce_background_shopping_design_elements_icons_6838055.jpg",
    category: "not now",
    quantity: 2,
     isFavorite: true
  ),



  ];
var _showFavoriteOnly =false;
  List<Product> get items{
    if(_showFavoriteOnly){
      return _items.where((prodItem) => prodItem.isFavorite).toList();
    }
    return [..._items];
  }
  Product findbyId(String id){
    return _items.firstWhere((prod) => prod.id ==id);
  }
  void showFavoritesOnly(){
    _showFavoriteOnly =true;
    notifyListeners();
  }
  void showAll(){
    _showFavoriteOnly =false;
    notifyListeners();
  }


  void addProduct(Product product){
    final newProduct =Product(
    name:product.name,
    description: product.description,
    price: product.price,
    quantity: product.quantity,
    category: product.category,
    imageUrl: product.imageUrl,
    id: DateTime.now().toString()
    );
    _items.add(newProduct);
    //_items.insert(0, newProduct);
    notifyListeners();
  }


  void deleteProduct(String id){
    _items.removeWhere((prod) => prod.id ==id);
    notifyListeners();
  }


  void updateProduct(String id, Product newProduct){
  final prodIndex =  _items.indexWhere((prod) => prod.id ==id);
  if (prodIndex >0){
    _items[prodIndex] =newProduct;
    notifyListeners();

  }else{

  }
    
  }


 
}

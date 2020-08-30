import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final String imageUrl;
  final int quantity;
  final double price;
  CartItem({
     @required this.id,
     @required this.name,
     @required this.imageUrl,
     @required this.quantity,
     @required this.price});
}

class Cart with ChangeNotifier {
  Map<String,CartItem>_items ={};


  Map<String,CartItem> get items{
    return{..._items};
  }
   
  int get itemCount{
    return  _items.length;
  }


  double get totalAmout{
    var total =0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;

     });
     return total;
  }



   int get subtract{
     var mm;
     _items.forEach((key, value) {
       mm = value.quantity - 1;
     });
     return mm;
   }
//     double get add
//   {
    
//     _items.forEach((key, caart) { 
//  if(caart.quantity >= 0)
//     {
//          return  caart.quantity + 1;
//     }
//     });
    
   
//   }


   void addItem(String productId, double price, String name, String imageUrl){
      if(_items.containsKey(productId)){
          _items.update(productId, (existingCartItem) => CartItem(
            id:existingCartItem.id,
            name:existingCartItem.name,
            price:  existingCartItem.price,
             quantity: existingCartItem.quantity +1,
             imageUrl: existingCartItem.imageUrl

            ));
      }else{
          _items.putIfAbsent(productId,()=>
           CartItem(
            id: DateTime.now().toString(),
           name: name,
            imageUrl: imageUrl,
             quantity: 1,
              price: price
              )
               );

      }
notifyListeners();
   }


}

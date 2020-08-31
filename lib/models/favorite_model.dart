import 'package:flutter/foundation.dart';

class FavoriteItem {
  final String id;
  final String name;
  final String imageUrl;
  final int quantity;
  final double price;
  FavoriteItem({
     @required this.id,
     @required this.name,
     @required this.imageUrl,
     @required this.quantity,
     @required this.price});
}

class Favorite with ChangeNotifier {
  Map<String,FavoriteItem>_items ={};


  Map<String,FavoriteItem> get items{
    return{..._items};
  }
   
  int get itemCount{
    return  _items.length;
  }





   void addItem(String productId, double price, String name, String imageUrl){
      if(_items.containsKey(productId)){
          _items.update(productId, (existingCartItem) => FavoriteItem(
            id:existingCartItem.id,
            name:existingCartItem.name,
            price:  existingCartItem.price,
             quantity: existingCartItem.quantity +1,
             imageUrl: existingCartItem.imageUrl
             

            ));
      }else{
          _items.putIfAbsent(productId,()=>
           FavoriteItem(
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

     void removeItem(String productId){
      _items.containsKey(productId);
        notifyListeners();
   }

   void removeSingleItem(String productId){
     if(!_items.containsKey(productId)){
       return ;
     }
     if(_items[productId].quantity>1){
       _items.update(productId, (exsitingFavItem) => FavoriteItem
       (id: exsitingFavItem.id,
       name: exsitingFavItem.name,
       price: exsitingFavItem.price,
       quantity: exsitingFavItem.quantity - 1
       ));
     }
     else{
       _items.remove(productId);
     }
     notifyListeners();

     
   }


void clear(){
  _items ={};
}

}

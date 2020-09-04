import 'package:flutter/foundation.dart';
class Cart with ChangeNotifier {
  List itemsClone = [];
  List _items = [];
 List get items => _items;
 set items (List itemsParameter){
   _items = itemsParameter;
   print(_items);
   notifyListeners();
 }

void addItemToCart(Map product){
  itemsClone.add(product);
  print(itemsClone);
  items = itemsClone;

    }
}

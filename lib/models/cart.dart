import 'package:flutter/foundation.dart';
class Cart with ChangeNotifier {
  int totalPrice = 0;
  List itemsClone = [];
  List _items = [];
 List get items => _items;
 set items (List itemsParameter){
   _items = itemsParameter;
   print(_items);
   notifyListeners();
 }

void addItemToCart(Map product){
  if(itemsClone.length == 0){
    itemsClone.add(product);
     items = itemsClone;
  }else{
            itemsClone.forEach((e) => {
            print(e["_id"] == product["_id"]),
            if(e["_id"] == product["_id"]){
                  
            }else{
              itemsClone.add(product),
              items = itemsClone,
            }
          });
  }

  print(itemsClone);
  

    }

    
void totalPriceFunction(int totalPriceFunctionParameter){
totalPrice += totalPriceFunctionParameter;
}


}

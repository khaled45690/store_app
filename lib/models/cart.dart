import 'dart:math';

import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  int _totalPrice = 0;
  List itemsClone = [];
  List totalPriceList = [];
  List _items = [];
  List get items => _items;
  int get totalPrice => _totalPrice;
  set items(List itemsParameter) {
    _items = itemsParameter;
    print(_items);
    notifyListeners();
  }

  set totalPrice(int totalPriceParameter) {
    _totalPrice = totalPriceParameter;
    print(_totalPrice);
    notifyListeners();
  }

  void addItemToCart(Map product) {
    if (itemsClone.length == 0) {
      itemsClone.add(product);
      items = itemsClone;
    } else {
      if (itemsClone.any((element) => element["_id"] == product["_id"])) {
      } else {
        itemsClone.add(product);
        items = itemsClone;
      }
    }

    print(itemsClone);
  }

  void totalPriceFunction(Map totalPriceFunctionParameter, String id) {
    print(totalPriceFunctionParameter);
    int finalPriceOutput = 0;
    if (itemsClone.length == 0) {
      totalPriceList.add(totalPriceFunctionParameter);
    } else {
      print(totalPriceList.any((element) => element[id] != null));
      if (totalPriceList.any((element) => element[id] != null)) {
        List filter = [];
        totalPriceList.forEach((element) {

          element.forEach((key, value) => {
          print(key),
            print(value),
                if (key == id)
                  {
                    filter.add(totalPriceFunctionParameter),
                  }
                else {filter.add(element)}
              });
        });
        totalPriceList = filter;
      } else {
        totalPriceList.add(totalPriceFunctionParameter);
      }
    }

    totalPriceList.forEach((element) {
      element.forEach((key, value) => {
        print(value),
        finalPriceOutput += value,
      });
    });
    totalPrice = finalPriceOutput;
  }
}

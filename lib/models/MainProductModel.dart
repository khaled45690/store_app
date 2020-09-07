import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/constants/kConstants.dart';
class MainProductModel extends ChangeNotifier {
  List _products = [];
  bool _refreshScreen = false ;

  List get products => _products;

  set products(List productsParameter){
    _products = productsParameter;
    print(_products);
    notifyListeners();
}

getMainProduct() async{
  print("${kUrl}getMainProduct");
  final response = await http.get("${kUrl}getMainProduct");
  products =  json.decode(response.body);
} 
printoo(){
    print(_products);
}

}

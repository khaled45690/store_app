import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/constants/kConstants.dart';
class MainProductModel extends ChangeNotifier {
  List _products = [];
  List get products => _products;

  set products(List productsParameter){
    _products = productsParameter;
//    print(_products);
    notifyListeners();
}
getMainProduct() async{
  print("${kUrl}Signin");
  final response = await http.get("${kUrl}getMainProduct");
  final List responseJson = json.decode(response.body);
  products =  json.decode(response.body);
}

}

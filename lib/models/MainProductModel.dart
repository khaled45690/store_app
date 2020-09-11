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

  deleteProduct(Map product) async {
    print("${kUrl}deleteProduct");

    List images = product["images"];

    images.forEach((element) async{
      final response = await http.post(
        "${kUrl}deleteProductImages",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(element),
      );
    });

print( jsonEncode(product));
    final response = await http.post(
      "${kUrl}deleteProduct",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product),
    );

    // final responseJson = json.decode(response.body);
    // print(responseJson);
    // if (responseJson["state"] != null) {
    //   print(responseJson);
    // } else {
    //   products = json.decode(response.body);
    // }
  }

}

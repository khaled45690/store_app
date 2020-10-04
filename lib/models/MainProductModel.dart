import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/constants/kConstants.dart';
class MainProductModel extends ChangeNotifier {
  List _products = [];

  List get products => _products;

  set products(List productsParameter){
    _products = productsParameter;
    notifyListeners();
}

getMainProduct() async{
  print("${kUrl}getMainProduct");
  final response = await http.get("${kUrl}getMainProduct");
  products =  json.decode(response.body);
}
printoo(){
  print("-------------------------------------------------------------------------->");
    print(_products);
}

  deleteProduct(Map product) async {
    print("${kUrl}deleteProduct");

    List images = product["images"];

    images.forEach((element) async{
      await http.post(
        "${kUrl}deleteProductImages",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(element),
      );
    });

     await http.post(
      "${kUrl}deleteProduct",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product),
    );

  }

}

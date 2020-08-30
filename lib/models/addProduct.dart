import 'package:flutter/foundation.dart';

class AddProduct extends ChangeNotifier {
  List<String> _productImages = [];
  List get productImages => _productImages;

   addProductImages(String userDataParameter){
    print(_productImages);
    _productImages.add(userDataParameter);
//    notifyListeners();
    printoo();
  }
  printoo(){
    print(_productImages);
  }
  resetImageVariable(){
    _productImages = [];
    notifyListeners();
  }

}

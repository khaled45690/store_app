import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';

class ScreenSize with ChangeNotifier {
  double _width;
  double productContainerWidth ;
  double fontSize;
  double favoriteIconBottomPadding ;
  double favoriteIconTopPadding ;
  double inputWidgetWidth ;

  double get width => _width;

  set width(double widthParameter) {
    _width = widthParameter;
    Timer(const Duration(milliseconds: 200), () {
      notifyListeners();
    });

  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
    print(width);
    if (width > 300 && width < 350){
      productContainerWidth = 105;
      fontSize = 15;
      favoriteIconBottomPadding = 190;
      favoriteIconTopPadding = 10;
      inputWidgetWidth = 230;
    }else if (width > 350 && width < 379){
      productContainerWidth = 120;
      fontSize = 17;
      favoriteIconBottomPadding = 230;
      favoriteIconTopPadding = 10;
      inputWidgetWidth = 250;
    }else if (width > 380 && width < 400){
      productContainerWidth = 140;
      fontSize = 17;
      favoriteIconBottomPadding = 250;
      favoriteIconTopPadding = 10;
      inputWidgetWidth = 290;
    }else if (width > 400 && width < 450){
      productContainerWidth = 150;
      fontSize = 19;
      favoriteIconBottomPadding = 270;
      favoriteIconTopPadding = 10;
      inputWidgetWidth = 300;
    }else{
      productContainerWidth = 150;
      fontSize = 19;
      favoriteIconBottomPadding = 270;
      favoriteIconTopPadding = 10;
      inputWidgetWidth = 300;
    }
  }



}

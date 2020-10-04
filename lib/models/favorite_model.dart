import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorite with ChangeNotifier {

  List _favorite = List();
  bool _isTrue = false;

  List get favorite => _favorite;
  bool get isTrue => _isTrue;

  set favorite(List favoriteParameter){
    _favorite = favoriteParameter;
    notifyListeners();
  }

  set isTrue(bool isTrueParameter){
    _isTrue = isTrueParameter;
    Timer(const Duration(milliseconds: 100), () {
      notifyListeners();
    });

  }

  void initialAssign (){
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    List favoriteInitialAssign = List();
    _prefs.then((SharedPreferences prefs) {
      favoriteInitialAssign.addAll(jsonDecode(prefs.get("favorite")));
      favorite = favoriteInitialAssign;

    });
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class UserData  extends ChangeNotifier{
   Map _userData;
   Map get userData => _userData;
   bool _isUserDataLoaded = false;
   bool get isUserDataLoaded => _isUserDataLoaded;

   void userDataSetter(Map userDataParameter) {
     userData = userDataParameter;
   }

   set userData(Map userDataParameter){
     _userData = userDataParameter;
     _isUserDataLoaded = true;
       notifyListeners();
   }

   }


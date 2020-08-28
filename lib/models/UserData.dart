import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class UserData  extends ChangeNotifier{
   Map _userData;
   Map get userData => _userData;
   bool _isUserDataLoaded = false;
   bool get isUserDataLoaded => _isUserDataLoaded;

   void userDataSetter(Map userDataParamater) {
     userData = userDataParamater;
   }

   set userData(Map userDataParamater){
     _userData = userDataParamater;
     _isUserDataLoaded = true;
       notifyListeners();
   }

   }


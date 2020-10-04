import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/constants/kConstants.dart';

updateUserData(Map userData) async {
  print("${kUrl}updateUserData");
   await http.post(
    "${kUrl}updateUserData",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userData),
  );
}
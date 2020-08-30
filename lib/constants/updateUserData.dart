import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:store_app/constants/kConstants.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

updateUserData(Map userData) async {
  print("${kUrl}updateUserData");
  final response = await http.post(
    "${kUrl}updateUserData",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userData),
  );
}
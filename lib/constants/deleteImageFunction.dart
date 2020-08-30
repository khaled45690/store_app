import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/constants/kConstants.dart';

deleteImage(String imageName) async {
  print("${kUrl}deleteImage");
  final response = await http.post(
    "${kUrl}deleteImage",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
      "imageName": imageName,
    }),
  );
}
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:store_app/constants/kConstants.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

saveImage(File imageFile) async {
  var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();
  print(Uri.parse("${kUrl}SaveImage"));
  var request = new http.MultipartRequest("POST", Uri.parse("${kUrl}SaveImage"));
  var multipartFile = new http.MultipartFile('file', stream, length,
      filename: basename(imageFile.path));
  request.files.add(multipartFile);
  var response = await request.send();
  print(response.statusCode);

  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
    
  });
}
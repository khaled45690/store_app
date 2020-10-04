import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:store_app/constants/kConstants.dart';

uploadAssetImages(Asset image) async {
  print("${kUrl}uploadAssetImages");
  Uri uri = Uri.parse("${kUrl}uploadAssetImages");
  http.MultipartRequest request = http.MultipartRequest("POST", uri);
  ByteData byteData = await image.getByteData();
  List<int> imageData = byteData.buffer.asUint8List();
  http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
    'image',
    imageData,
  );
  request.files.add(multipartFile);
// send
  var response = await request.send();
  print(response.statusCode);


response.stream.transform(utf8.decoder).listen((value) {
  });

}
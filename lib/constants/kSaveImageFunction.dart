import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/models/UserData.dart';
import 'package:async/async.dart';
import 'package:store_app/constants/updateUserData.dart';

saveImage(File imageFile , String name , Map userDataClone) async {
  UserData userData = new UserData();


  var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();
  print(Uri.parse("${kUrl}SaveImage"));
  var request = new http.MultipartRequest("POST", Uri.parse("${kUrl}SaveImage"));
  var multipartFile = new http.MultipartFile('file', stream, length,
      filename: "ProfilePic$name");
  request.files.add(multipartFile);
  var response = await request.send();
  print(response.statusCode);

  response.stream.transform(utf8.decoder).listen((value) {
    Map data = json.decode(value);
    print(data);
    userDataClone["profileImage"] = data["url"];
    userData.updateUserInfo(userDataClone);
    updateUserData(userDataClone);
  });
}
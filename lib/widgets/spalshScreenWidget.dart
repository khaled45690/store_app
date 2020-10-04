import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/models/screenSizeModel.dart';
import 'package:store_app/screens/MainProductScreen.dart';
import 'package:http/http.dart' as http;


class SpashScreenWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = Provider.of<ScreenSize>(context);
    // http.get(kUrl);
    screenSize.width = MediaQuery.of(context).size.width;
    return SplashScreen(
      seconds:7,
      backgroundColor: Colors.white,
      title: Text("E-Commerece App",style: TextStyle(fontSize:24,fontWeight:FontWeight.bold,color: Colors.green),),
      image: Image.network('https://scontent.faly2-1.fna.fbcdn.net/v/t1.0-9/67513432_507802676695843_138928972116262912_o.png?_nc_cat=102&_nc_sid=09cbfe&_nc_ohc=B1SYUYFTo9kAX8wz8oQ&_nc_ht=scontent.faly2-1.fna&oh=0c25a3e5810669bcbea0876696199903&oe=5F7A8BBA'),
      loaderColor: Colors.black,
      //onClick: ,
      photoSize: 150,
      navigateAfterSeconds: MainProductScreen(),
      
    );
  }
}
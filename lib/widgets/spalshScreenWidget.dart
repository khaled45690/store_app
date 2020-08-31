import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:store_app/screens/MainProductScreen.dart';


class SpashScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds:20,
      backgroundColor: Colors.white,
      title: Text("yabny zabat el UI yab2a responsive we ba3deen mnzal package 3shan ta3mal 7aga zy keda 25s 3leeeeeeeeeek  bs 7lwa bardo ",style: TextStyle(fontSize:24,fontWeight:FontWeight.bold,color: Colors.blue),),
      image: Image.network('https://scontent.faly2-1.fna.fbcdn.net/v/t1.0-9/95945567_3178758682182826_597523516736143360_o.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_ohc=aMoNQW5sb5gAX8dFvZr&_nc_ht=scontent.faly2-1.fna&oh=97143d52f2d7cfc8119e05870d71fda5&oe=5F711785'),
      loaderColor: Colors.black,
      photoSize: 150,
      navigateAfterSeconds: MainProductScreen(),
      
    );
  }
}
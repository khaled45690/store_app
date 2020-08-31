import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:store_app/screens/MainProductScreen.dart';


class SpashScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds:5,
      backgroundColor: Colors.black,
      title: Text("Sora kolha 3zmaa w walahy w elly y2ol 8er kad teez",style: TextStyle(fontSize:24,fontWeight:FontWeight.bold,color: Colors.blue),),
      image: Image.network('https://scontent.faly2-1.fna.fbcdn.net/v/t1.0-9/95945567_3178758682182826_597523516736143360_o.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_ohc=aMoNQW5sb5gAX8dFvZr&_nc_ht=scontent.faly2-1.fna&oh=97143d52f2d7cfc8119e05870d71fda5&oe=5F711785'),
      loaderColor: Colors.white,
      photoSize: 150,
      navigateAfterSeconds: MainProductScreen(),
      
    );
  }
}
import 'package:flutter/material.dart';
import 'package:store_app/shared/globals.dart';
class AppBarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration:  BoxDecoration(
       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20) , bottomRight: Radius.circular(20)),
       // gradient:
         //LinearGradient(
          color: 
          //<Color>[
            Global.mediumBlue,
            // Color(0xFF0D47A1),
            // Color(0xFF1976D2),
            // Color(0xFF42A5F5),
         // ],
        //),
      ),
    );
  }
}

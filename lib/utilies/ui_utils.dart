
import 'package:flutter/cupertino.dart';
import 'package:store_app/enums/devices_screen_tybe.dart';

DevicesScreenType getDeviceType(MediaQueryData mediaQuery){
   var orientaion = mediaQuery.orientation;

   //fixed device width
   double deviceWidth =0;

   if(orientaion==Orientation.landscape){
     deviceWidth = mediaQuery.size.height;
   }else{
     deviceWidth = mediaQuery.size.width;
   }

   if(deviceWidth>950){
     return DevicesScreenType.Desktop;
   }
   if(deviceWidth>600){
     return DevicesScreenType.Tablet;
   }
   return DevicesScreenType.Mobile;
}
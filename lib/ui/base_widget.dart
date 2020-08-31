

import 'package:flutter/material.dart';
import 'package:store_app/ui/sizingInfo.dart';
import 'package:store_app/utilies/ui_utils.dart';


class BaseWidget extends StatelessWidget {
  final Widget Function(
    BuildContext context, SizingInformation sizingInformation) builder;
  const BaseWidget({Key key,this.builder}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    var mediaQuery =MediaQuery.of(context); 
  
    return
    LayoutBuilder(builder: ( context, boxConstraints) { 
       var sizingInformation =SizingInformation(
     orientation: mediaQuery.orientation,
     devicesScreenType: getDeviceType(mediaQuery),
     screenSize: mediaQuery.size,
     localWidgetSize: 
     Size(boxConstraints.maxWidth, boxConstraints.minHeight)
   );
    builder(context,sizingInformation);
    
     });
  }
}
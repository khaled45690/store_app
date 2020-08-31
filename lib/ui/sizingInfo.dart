import 'package:flutter/material.dart';
import 'package:store_app/enums/devices_screen_tybe.dart';


class SizingInformation{
  final Orientation orientation;
  final DevicesScreenType devicesScreenType;
  final Size screenSize;
  final Size localWidgetSize;
  SizingInformation({
    this.orientation,
    this.devicesScreenType,
    this.screenSize,
    this.localWidgetSize});

@override
String toString() {
  return'Orientation:$orientation  DevicesType:$devicesScreenType ScreenSize:$screenSize  LocalWidgetSize:$localWidgetSize  ' ;
  }


}



import 'package:flutter/material.dart';
import 'package:store_app/ui/base_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInformation) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [
                Container(
                  height:0,
                  width: 0,
                  margin: const EdgeInsets.all(50),
                  color:Colors.blue,
                  child:BaseWidget(builder: (context,sizingInfo) =>Text(sizingInfo.toString()),)
                ),
                Text(sizingInformation.toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}

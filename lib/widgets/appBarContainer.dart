import 'package:flutter/material.dart';
class AppBarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100) , bottomRight: Radius.circular(100)),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF0D47A1),
            Color(0xFF1976D2),
            Color(0xFF42A5F5),
          ],
        ),
      ),
    );
  }
}

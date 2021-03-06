import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
final String text;
final double fontSize;
var onClick;
  

CustomButton({@required this.text  , this.fontSize ,
@required this.onClick


});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: InkWell(
          onTap: (){ this.onClick(); },
          child: Container(
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.white , fontSize: fontSize),
              ),
            ),
            width: 100.0,
            height: 40.0,
          ),
        ),
        color: Colors.transparent,
      ),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
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

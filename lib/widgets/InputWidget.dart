import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/screenSizeModel.dart';
class InputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = Provider.of<ScreenSize>(context);
    return  Container(
      width: screenSize.inputWidgetWidth,
    
      child: Center(
        child: TextFormField(
          style: TextStyle(
            fontSize: 20,
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "";
              // ignore: missing_return
            }else{
              return "";
            }
          },
          onSaved:(ss){},
          obscureText: false,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            hintText: "Search",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0.0),
            prefixIcon: Icon(
              Icons.search,
              size: 20,
              color: Colors.white,
            ),
            filled: true,
            fillColor: Colors.white60,
            enabledBorder: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

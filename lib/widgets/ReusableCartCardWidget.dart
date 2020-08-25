import 'package:flutter/material.dart';
class ReusableCartCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
            color: Color(0xFFE8E6FE),
            child: Image.network("https://specs-tech.com/wp-content/uploads/2019/09/Huawei-Mate-30-Pro-5G-600x600.jpg"),
            ),
            Container(
              height: 110,
              child: Column(
                children: <Widget>[
                  Text(
                      "Name of Product",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  SizedBox(height: 50,),
                  Text(
                    "Price \$",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 110,
              child: Column(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.keyboard_arrow_up), iconSize: 20 , onPressed: (){

                  }),
                  IconButton(icon: Icon(Icons.keyboard_arrow_down),iconSize: 20, onPressed: (){

                  }),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "number",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

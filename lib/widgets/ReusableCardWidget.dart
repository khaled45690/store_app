import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ReusableCardWidget extends StatefulWidget {
  @override
  _ReusableCardWidgetState createState() => _ReusableCardWidgetState();
}

class _ReusableCardWidgetState extends State<ReusableCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom:10),
      margin: EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 140,
                child: Image.network("https://specs-tech.com/wp-content/uploads/2019/09/Huawei-Mate-30-Pro-5G-600x600.jpg"),
              ),
              SizedBox(height: 20.0),
              Text(
                "name of item",
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 18,

                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "price of item \$",
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 18,

                ),
              ),
              SizedBox(height: 60.0),
              RaisedButton(
                onPressed: () {
                  print("ww");
                },
                textColor: Colors.white,
                padding:  EdgeInsets.all(0.0),
                child: Container(
                  decoration:  BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding:  EdgeInsets.all(10),
                  child:
                  Text('Add to Cart', style: TextStyle(fontSize: 15)
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.only(bottom: 260),
                color: Colors.red,
                icon: Icon(Icons.favorite),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
  }



















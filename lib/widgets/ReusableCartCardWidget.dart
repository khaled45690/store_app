import 'package:flutter/material.dart';
class ReusableCartCardWidget extends StatelessWidget {
    final String id;
  final double price;
  final int quantity;
  final String name;
  final String imageUrl;
  ReusableCartCardWidget(this.id,this.price,this.quantity,this.name,this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Card(
          child: Padding(
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
              child: 
 
              Image.network
              (
                imageUrl
               // '\$$imageUrl'
                ),
              ),
              Container(
                height: 110,
                child: Column(
                  children: <Widget>[
                    Text(
                        name,
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 50,),
                    Text(
                      '\$${price.toString()}',
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
                //  quantity.toString(),
                ('$quantity number'),
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

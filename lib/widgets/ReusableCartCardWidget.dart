import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/cart.dart';
class ReusableCartCardWidget extends StatefulWidget {
    final String id;
  final double price;
  int quantity;
  final String name;
  final String imageUrl;
  ReusableCartCardWidget(this.id,this.price,this.quantity,this.name,this.imageUrl);

  @override
  _ReusableCartCardWidgetState createState() => _ReusableCartCardWidgetState();
}

class _ReusableCartCardWidgetState extends State<ReusableCartCardWidget> {
  @override
  Widget build(BuildContext context) {
           final cart = Provider.of<Cart>(context);

    return  Card(
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
                  widget.imageUrl
                 // '\$$imageUrl'
                  ),
                ),
                Container(
                  height: 110,
                  child: Column(
                    children: <Widget>[
                      Text(
                          widget.name,
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 50,),
                      Text(
                        '\$${widget.price.toString()}',
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
                     //   cart.add;
                        add();
                      }),
                      IconButton(icon: Icon(Icons.keyboard_arrow_down),iconSize: 20, onPressed: (){
                          subtract();
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                  //  quantity.toString(),
                  ('${widget.quantity} number'),
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ),
                //  Container(
                //   margin: EdgeInsets.only(top: 40),
                //   child: Text(
                // cart.totalAmout.toString(),
                //   //  quantity.toString(),
                // //  ('${widget.quantity} number'),
                
                //     style: TextStyle(
                //         fontSize: 20
                //     ),
                //   ),
                // ),
               
              ],
            ),
            
          ),
          
          
        ),
    );
      

    
  }

  void subtract()
  {
    if(widget.quantity >= 0)
    {
    setState(() {
            widget.quantity = widget.quantity - 1;

        });

    }
  }

  void add(){

    if(widget.quantity >= 0){
      setState(() {
        widget.quantity = widget.quantity +1;
      });
    }

  }
}



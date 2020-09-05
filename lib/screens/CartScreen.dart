import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/ReusableCartCardWidget.dart';
import 'package:store_app/widgets/appBarContainer.dart';

class CartWidget extends StatelessWidget {
  static const routeName = '/CartWidget';
  @override
  Widget build(BuildContext context) {

       final cart = Provider.of<Cart>(context);
    //final product = Provider.of<Product>(context,listen: false);

    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F3FF),
        appBar: AppBar(
          flexibleSpace: AppBarContainer(),
          title: Text("Cart Screen"),
        ),
        body: Stack(
                  children:[ Container(
              child:ListView.builder(
                itemCount:cart.items.length ,
                itemBuilder:(ctx, i)=> ReusableCartCardWidget(cart.items[i]),
                




       
              ),
              
              
              
                  ),
                  // SizedBox(height:1),
                  Padding(
                    padding: const EdgeInsets.only(top:500.0),
                    child:
                      Card(
                        
                        color: Colors.blueAccent,
                        child: 
                        Padding(
                         padding: EdgeInsets.all(20),
                          child: ListTile(
                            leading: Text("Total price:",style:TextStyle(color: Colors.black,fontSize: 30)
                            ,),
//                            trailing: Text('\$${cart.totalAmout}',style:TextStyle(color: Colors.black,fontSize: 30)),
                          )
                          
                          ),
                        
                 //    child: Text("dsad")
                        
                      ),
                    ),
                //  )
                 
                  ],
        ),
        
      
        
        
      ),
      
      
      
    );
  }
}













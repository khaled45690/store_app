import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/widgets/ReusableCartCardWidget.dart';
import 'package:store_app/widgets/appBarContainer.dart';

import 'LoginNew.dart';

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
                        
                        color: Colors.white10,
                        child: 
                        Padding(
                         padding: EdgeInsets.all(20),
                          child: ListTile(
                            leading: Text("Total price: ${cart.totalPrice} \$",style:TextStyle(color: Colors.black,fontSize: 20)
                            ,),
                            trailing: Container(
                              
                              width: 100,
                              height: 150,
                              
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                child: FlatButton(
                                  onPressed: (){
                                    showDialog(context: context,
                                    builder: (context) => AlertDialog(
                                      content: Text('you have to sign in first'),
                                      actions: <Widget>[
                                          FlatButton(
                                            onPressed: (){
                                              Navigator.of(context).popAndPushNamed(LoginPage.routeName);
                                            }, 
                                            child: Text("Sign in"),
                                            ),
                                            FlatButton(onPressed:() {Navigator.of(context).pop();},
                                             child: Text("Cancel"))

                                      ],
                                    )
                                    
                                    
                                    );
                                  },
                                
                                
                                 child: Text("buy it ",style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold),))))
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













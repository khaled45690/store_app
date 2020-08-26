import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/productDetails.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  UserProductItem(this.id, this.name, 
  this.imageUrl
  );
  @override
  Widget build(BuildContext context) {
    //   final product = Provider.of<Product>(context);

    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white
        ),
        alignment: Alignment.centerRight ,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
         confirmDismiss: (ctx){
             return  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('Are you sure?'),
                            content: Text("Do you want to remove the item ?"),
                            backgroundColor: Colors.white,
                            actions: <Widget>[
                              FlatButton(
                                onPressed: (){
                                  Navigator.of(ctx).pop(false);
                                },
                               child: Text("no")
                               ),
                              FlatButton(
                                onPressed: (){
                                      Navigator.of(ctx).pop(true);

                                },
                               child: Text("yes"),
                               )
                            ],
                          )
                          );
            },
            onDismissed:(direction){
                 Provider.of<Products>(context,listen: false).deleteProduct(id);
            },
      child: Card(
        
        child: ListTile(
          onTap: (){
                      Navigator.of(context).pushNamed(
            ProductDetails.routeName,
            arguments: id
                      );
          },
            
          title: Text(name),
          leading: CircleAvatar(
            backgroundImage: NetworkImage( imageUrl),
          ),
          trailing: Container(
            width: 50,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.blue,
                  onPressed: () {},
                ),
              
                //  IconButton(icon: Icon(Icons.delete),
                // onPressed: (){

                // },
                // color: Colors.red,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:store_app/screens/CartScreen.dart';
import 'package:store_app/screens/FavoriteScreen.dart';
import 'package:store_app/screens/amdin/addProduct.dart';
import 'package:store_app/screens/loginScreen.dart';

class AppDrawer extends StatelessWidget {
  Widget build(BuildContext context) {

    return Drawer(
        child:ListView(
            children:<Widget>[

              new UserAccountsDrawerHeader(
                accountName: Text("khaled"),
                accountEmail: Text("SunCity@User.com"),
                currentAccountPicture: GestureDetector(
                  child:   new CircleAvatar(
                      backgroundColor:Colors.white,
                      child:Icon(Icons.person,color:Colors.blue)
                  ),
                ),
                decoration: new BoxDecoration(
                    color:Colors.blue
                ),

              ),
               InkWell(
                onTap: (){
                 Navigator.of(context).pushNamed(AdminAddProduct.routeName);
                },
                child: ListTile(
                  title: Text("ManageProduct"),
                  leading: Icon(Icons.edit,color: Colors.blue,),
                ),
              ),
               InkWell(
                onTap: (){
                     Navigator.of(context).pushNamed(CartWidget.routeName);
                },
                child: ListTile(
                  title: Text("ShopCart"),
                  leading: Icon(Icons.shopping_cart,color: Colors.blue,),
                ),
              ),
              InkWell(
                onTap: (){
                     Navigator.of(context).pushNamed(FavoriteScreen.routeName);
                },
                child: ListTile(
                  title: Text("Favorite"),
                  leading: Icon(Icons.favorite,color: Colors.blue,),
                ),
              ),

                
              InkWell(
                onTap: (){
                 Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.close,color: Colors.blue,),
                ),
              ),
              

            ]
        )
    );
  }
}


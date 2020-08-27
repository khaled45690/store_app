import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants/kSaveImageFunction.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/CartScreen.dart';

import 'package:store_app/screens/MainProductScreen.dart';
import 'package:store_app/screens/amdin/addProduct.dart';
import 'package:store_app/screens/loginScreen.dart';
import 'package:image_picker/image_picker.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    final productsContainer =Provider.of<Products>(context,listen: false);
    return Drawer(
        child:ListView(
            children:<Widget>[

               UserAccountsDrawerHeader(
                accountName: Text("khaled"),
                accountEmail: Text("SunCity@User.com"),
                currentAccountPicture: GestureDetector(
                  onTap: () async{
                    final picked = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      _imageFile = picked;
                    });
                    saveImage(picked);
                    print(picked);
                  },
                  child: _imageFile == null? CircleAvatar(
                      backgroundColor:Colors.white,
                      child:Icon(Icons.person,color:Colors.blue)
                  ): CircleAvatar(
                      backgroundImage : Image.file(_imageFile).image,
                  ),
                ),
                decoration:  BoxDecoration(
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
               //   Navigator.of(context).pushNamed(FavoriteScreen.routeName);
               productsContainer.showFavoritesOnly();
              // Navigator.of(context).pushNamed(MainProductScreen.routeName);


                },
                child: ListTile(
                  title: Text("MyFavorite"),
                  leading: Icon(Icons.favorite,color: Colors.blue,),
                ),
              ),
                  InkWell(
                onTap: (){
               //   Navigator.of(context).pushNamed(FavoriteScreen.routeName);
               productsContainer.showAll();
              // Navigator.of(context).pushNamed(MainProductScreen.routeName);


                },
                child: ListTile(
                  title: Text("ShowAll Products"),
                  leading: Icon(Icons.select_all,color: Colors.blue,),
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






import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants/deleteImageFunction.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/constants/kSaveImageFunction.dart';
import 'package:store_app/constants/updateUserData.dart';
import 'package:store_app/models/UserData.dart';
import 'package:store_app/models/favorite_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/CartScreen.dart';
import 'package:store_app/screens/FavoriteScreen.dart';

import 'package:store_app/screens/MainProductScreen.dart';
import 'package:store_app/screens/amdin/addProduct.dart';
import 'package:store_app/screens/loginScreen.dart';
import 'package:image_picker/image_picker.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final Products productsContainer =
        Provider.of<Products>(context, listen: false);
    final UserData userData = Provider.of<UserData>(context, listen: false);
    if (userData.userData != null) {
      print(userData.userData["profileImage"]);
      return Drawer(
        
          child: ListView(children: <Widget>[
  
        UserAccountsDrawerHeader(
          accountName: Text(userData.userData["name"]),
          accountEmail: Text(userData.userData["email"]),
          currentAccountPicture: GestureDetector(
            onTap: () async {
              Map userDataClone = userData.userData;
              if(userDataClone["profileImage"] == null){
                final picked =
                await ImagePicker.pickImage(source: ImageSource.gallery);
                if(picked != null){
                  saveImage(picked);
                  userDataClone["profileImage"] = basename(picked.path);
                  updateUserData(userDataClone);
                  print(userData.userData);
                    userData.userData = userDataClone;
                }

              }else {

                final picked =
                await ImagePicker.pickImage(source: ImageSource.gallery);
                if(picked != null){
                  deleteImage(userDataClone["profileImage"]);
                  saveImage(picked);
                  userDataClone["profileImage"] = basename(picked.path);
                  updateUserData(userDataClone);
                  print(userData.userData);
                  userData.userData = userDataClone;
                }
              }

            },
            child: userData.userData["profileImage"] == null
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.blue))
                : CircleAvatar(
                    backgroundImage: Image.network("${kUrl}getImage/${userData.userData["profileImage"]}").image,
                  ),
          ),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        userData.userData["isAdmin"]
            ? InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AdminAddProduct.routeName);
                },
                child: ListTile(
                  title: Text("ManageProduct"),
                  leading: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                ),
              )
            : Container(),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CartWidget.routeName);
          },
          child: ListTile(
            title: Text("ShopCart"),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.blue,
            ),
          ),
        ),
        InkWell(
          onTap: () {
              Navigator.of(context).pushNamed(FavoriteScreen.routeName);
         //   productsContainer.showFavoritesOnly();
            // Navigator.of(context).pushNamed(MainProductScreen.routeName);
          },
          child: ListTile(
            title: Text("MyFavorite"),
            leading: Icon(
              Icons.favorite,
              color: Colors.blue,
            ),
          ),
        ),
        // InkWell(
        //   onTap: () {
           
        //  //   productsContainer.showAll();
        //       Navigator.of(context).pushNamed(FavoriteScreen.routeName);
        //   },
        //   child: ListTile(
        //     title: Text("ShowAll Products"),
        //     leading: Icon(
        //       Icons.select_all,
        //       color: Colors.blue,
        //     ),
        //   ),
        // ),
        InkWell(
          onTap: () {
            userData.userData = null;
            userData.isUserDataLoaded = false ;
            Navigator.of(context).pop();
          },
          child: ListTile(
            title: Text("Logout"),
            leading: Icon(
              Icons.close,
              color: Colors.blue,
            ),
          ),
        ),
      ]));
    } else {
      return Drawer(
          child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          },
          child: ListTile(
            title: Text(
              "Sign in",
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.account_circle,
              color: Colors.blue,
              size: 40,
            ),
          ),
        ),
             InkWell(
          onTap: () {
            Navigator.of(context).popAndPushNamed(FavoriteScreen.routeName);
          },
          child: ListTile(
            title: Text(
              "wishlist",
              style: TextStyle(fontSize: 18),
            ),
            leading: Icon(
              Icons.account_circle,
              color: Colors.blue,
              size: 40,
            ),
          ),
        ),
      ]));
    }
  }
}

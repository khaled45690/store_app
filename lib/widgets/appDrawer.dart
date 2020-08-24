import 'package:flutter/material.dart';

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
                     Navigator.of(context).pushNamed("/FavoriteScreen");
                },
                child: ListTile(
                  title: Text("Favorite"),
                  leading: Icon(Icons.favorite,color: Colors.blue,),
                ),
              ),

              InkWell(
                onTap: (){
//                  Navigator.of(context).pushNamed(Login.routeName);
                },
                child: ListTile(
                  title: Text("تسجيل الدخول"),
                  leading: Icon(Icons.close,color: Colors.blue,),
                ),
              ),

            ]
        )
    );
  }
}


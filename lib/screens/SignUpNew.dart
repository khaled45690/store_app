import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/models/UserData.dart';
import 'package:store_app/screens/LoginNew.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/shared/globals.dart';


import 'loginScreen.dart';

class SignUpNew extends StatefulWidget {
    UserData userData = new UserData();
      final GlobalKey<FormState> _key = GlobalKey<FormState>();
       String name, email, password, confirmPassword;

  submitForm(String name, String email, String password, String confirmPassword,
      context) async {
    UserData userDataContext = Provider.of<UserData>(context, listen: false);
    print("${kUrl}Signup");
    final response = await http.post(
      "${kUrl}Signup",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        "name": name,
        "email": email,
        "password": password,
        "isAdmin": false,
        "favorite": []
      }),
    );

    final Map responseJson = json.decode(response.body);
    print(responseJson);
    if (responseJson["state"] != null) {
      print(responseJson);
    } else {
      userDataContext.userData = responseJson;
    }
  }



    

    static const routeName = '/SignUpPage';

  @override
  _SignUpNewState createState() => _SignUpNewState();
}

class _SignUpNewState extends State<SignUpNew> {
  @override
  Widget build(BuildContext context) {
      UserData userDataContext = Provider.of<UserData>(context);
    print(userDataContext.isUserDataLoaded);
    if (userDataContext.isUserDataLoaded) {
      Timer(const Duration(milliseconds: 200), () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      });
    }
    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          ListView(
            children:<Widget>[
          Padding(
            padding: const EdgeInsets.only(top:0.0),
            child: Text("Login By:",style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
          ),
         // SizedBox(height:15),
          Container(
            padding: const EdgeInsets.only(top:23.0),
            child: Transform.rotate(
              angle: 0,
              origin: Offset(-300,30),
                        child: Container(
                          color: Global.mediumBlue,
                          
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                                      child: IconButton(icon: Icon(
                      FontAwesomeIcons.facebook
                      ), onPressed: null
                      ),
                  ),
                                       SizedBox(width: 10,), 

                     CircleAvatar(
                                            child: IconButton(icon: Icon(
                    FontAwesomeIcons.instagram
                    ), onPressed: null
                    ),
                     ),
                     SizedBox(width: 10,), 
                     CircleAvatar(
                                            child: IconButton(icon: Icon(
                    FontAwesomeIcons.google
                    ), onPressed: null
                    ),
                     ),
                ],
              ),
                          ),
                        ),
            ),
          ),
          Form(
            key: widget._key,
                      child: Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Container(
                  color: Colors.grey.withOpacity(0.05),
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            validator: (value){
                              if(value.isEmpty) return 'required name';
                            },
                            onChanged: (value) {
                              widget.name = value;
                               },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                hintText: "name",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                             validator: (value){
                              if(value.isEmpty) return 'required Email';
                              return null;
                            },
                             onChanged: (value) {
                              widget.email = value;
                               },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                hintText: "Email",
                                
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                             validator: (value){
                              if(value.isEmpty) return 'required password';
                              return null;
                            },
                             onChanged: (value) {
                              widget.password = value;
                               },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                hintText: "Password",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                             validator: (value){
                              if(value.isEmpty) return 'required password';
                              return null;
                            },
                             onChanged: (value) {
                              widget.confirmPassword = value;
                               },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                hintText: "Confirm Password ",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(height: 16.0),
                      //  SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                             validator: (value){
                              if(value.isEmpty) return 'required phone';
                              return null;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                hintText: "Phone ",
                                border: OutlineInputBorder()),
                          ),
                        ),
                                              SizedBox(height: 15.0),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal:90),
                          width: double.infinity,
                          child: RaisedButton(
                            
                            color:Global.mediumBlue,
                            onPressed: (){
                              if(widget._key.currentState.validate()){
                            widget.submitForm(widget.name, widget.email, widget.password, widget.confirmPassword, context);

                                Navigator.of(context).popAndPushNamed(LoginPage.routeName);
                              }

                            },
                            
                          child: Text("SignUp",style: TextStyle(
                            fontWeight:FontWeight.bold,color: Colors.white
                          ),),
                          
                          
                          ),
                           decoration:  BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(25)
        ),)
                        ),
                        SizedBox(height: 8.0),
                         Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed(LoginPage.routeName);
                  },
                  child: Text(
                    'already have an accont',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                )
              ],
            )
                      ]
                      ),
                ),
              ),
            ),
            )]  ),
        ]
        
        ),
      ),
    );
  }
}

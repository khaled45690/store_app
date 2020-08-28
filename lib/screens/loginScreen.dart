import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants/kConstants.dart';
import 'package:store_app/models/UserData.dart';
import 'package:store_app/screens/MainProductScreen.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/screens/SignUpScreen.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/CustomTextField.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/LoginScreen';
  String email , password ;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();



  submitForm(String email, String password, context) async {
    UserData userDataContext = Provider.of<UserData>(context, listen: false);
    print("${kUrl}Signin");
    final response = await http.post(
      "${kUrl}Signin",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        "email": email,
        "password": password,
      }),
    );

    final Map responseJson = json.decode(response.body);
    print(responseJson);
    if (responseJson["state"] != null) {
      print(responseJson);
    } else {
      userDataContext.userDataSetter(responseJson);
    }
  }


  @override
  Widget build(BuildContext context) {
    UserData userDataContext = Provider.of<UserData>(context);
    print(userDataContext.isUserDataLoaded);
    if (userDataContext.isUserDataLoaded) {
      Timer(const Duration(milliseconds: 200), () {
        Navigator.of(context).pop();
      });
    }
    return Scaffold(
      // appBar: AppBar(
      // title:  Text("Login Page")
      // ),

      backgroundColor: Colors.white,

      body: Form(
        key: _key,
        child: ListView(children: <Widget>[
          SizedBox(height: 170),
          CustomTextField(
            hint: 'Enter your email',
            icon: Icons.email,
              onchange: (value){
                email = value;
              }
          ),
          SizedBox(height: 15),
          CustomTextField(
            hint: 'Enter your Password',
            icon: Icons.lock,
              onchange: (value){
                password = value;
              }
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: CustomButton(
              text: "Sign in",
              fontSize: 18,
              onClick: () {
                submitForm(email, password, context);
              },
            
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Don\t have an account?',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).popAndPushNamed(SignUp.routeName);
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}


import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/UserData.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/CustomTextField.dart';
import 'package:http/http.dart' as http;
import 'MainProductScreen.dart';
import 'loginScreen.dart';
import 'package:store_app/constants/kConstants.dart';

class SignUp extends StatelessWidget {
  UserData userData = new UserData();
  static const routeName = '/SignUp';

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
      body: Form(
        key: _key,
        child: ListView(children: <Widget>[
          SizedBox(height: 170),
          CustomTextField(
            hint: 'Enter your name',
            icon: Icons.person,
            onchange: (value) {
              name = value;
            },
          ),
          SizedBox(height: 15),
          CustomTextField(
            hint: 'Enter your email',
            icon: Icons.email,
            onchange: (value) {
              email = value;
            },
          ),
          SizedBox(height: 15),
          CustomTextField(
            hint: 'Enter your Password',
            icon: Icons.lock,
            onchange: (value) {
              password = value;
            },
          ),
          SizedBox(height: 15),
          CustomTextField(
            hint: 'Confirm Password',
            icon: Icons.lock,
            onchange: (value) {
              confirmPassword = value;
            },
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: CustomButton(
              text: "Sign up",
              fontSize: 18,
              onClick: () {
                submitForm(name, email, password, confirmPassword, context);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
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
        ]),
      ),
    );
  }
}

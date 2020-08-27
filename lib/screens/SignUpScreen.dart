import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/CustomTextField.dart';
import 'package:http/http.dart' as http;
import 'loginScreen.dart';
import 'package:store_app/constants/kConstants.dart';


class SignUp extends StatelessWidget {
      static const routeName = '/SignUp';
      final GlobalKey<FormState> _key = GlobalKey<FormState>();
      String name , email , password , confirmPassword ;

      submitForm(String name , String email ,String password ,String confirmPassword ) async {
        print("entered");
        final response = await http.post(
          "${kUrl}Signup",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<dynamic, dynamic>{
            "name": name,
            "email" :email,
            "password": password,
            "isAdmin" : false,
          }),
        );


        final responseJson = json.decode(response.body);

        print(responseJson);
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Form(
        key: _key,
              child: ListView(
          children:< Widget>[
            SizedBox(height:170),
              CustomTextField(
              hint: 'Enter your name',
              icon: Icons.person,
                onchange: (value){
                  name = value;
                },
            ),
              SizedBox(height:15),

            CustomTextField(
              hint: 'Enter your email',
              icon: Icons.email,
              onchange: (value){
                email = value;
              },
            ),
           SizedBox(height:15),
            CustomTextField(
              hint: 'Enter your Password',
              icon: Icons.lock,
              onchange: (value){
                password = value;
              },
            ),
                        SizedBox(height:15),

            CustomTextField(
              hint: 'Confirm Password',
              icon: Icons.lock,
              onchange: (value){
                confirmPassword = value;
              },
            ),
            SizedBox(height:15),
               Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: CustomButton(
                text: "Sign up",
                fontSize: 18,
                onClick: (){
                print("$name , $email , $password , $confirmPassword");
                submitForm(name , email , password , confirmPassword);

           },
              ),
            ),
                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                
                GestureDetector(
                  onTap: (){
                     Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                                child: Text(
                    'already have an accont',
                    style: TextStyle(
                      fontSize:22,
                    ),
                  ),
                )
              ],
            )
          
          ]
        ),
      ),
      
    );
  }
}
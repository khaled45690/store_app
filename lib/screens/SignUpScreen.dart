import 'package:flutter/material.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/CustomTextField.dart';

import 'loginScreen.dart';


class SignUp extends StatelessWidget {
      static const routeName = '/SignUp';
          final GlobalKey<FormState> _key = GlobalKey<FormState>();

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
                print(value);
                },
            ),
              SizedBox(height:15),

            CustomTextField(
              hint: 'Enter your email',
              icon: Icons.email,
              onchange: (value){
                print(value);
              },
            ),
           SizedBox(height:15),
            CustomTextField(
              hint: 'Enter your Password',
              icon: Icons.lock,
              onchange: (value){
                print(value);
              },
            ),
                        SizedBox(height:15),

            CustomTextField(
              hint: 'Confirm Password',
              icon: Icons.lock,
              onchange: (value){
                print(value);
              },
            ),
            SizedBox(height:15),
               Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: CustomButton(
                text: "Sign up",
                fontsize: 18,
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
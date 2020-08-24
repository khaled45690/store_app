import 'package:flutter/material.dart';
import 'package:store_app/screens/MainProductScreen.dart';
import 'package:store_app/screens/SignUpScreen.dart';
import 'package:store_app/widgets/CustomTextField.dart';



class LoginScreen extends StatelessWidget {
    static const routeName = '/LoginScreen';
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title:  Text("Login Page")
      // ),
      
      backgroundColor: Colors.white,
      
      body: Form(
        key: _key ,
              child: ListView(
          children:< Widget>[
            SizedBox(height:170),
            CustomTextField(
              hint: 'Enter your email',
              icon: Icons.email,
            ),
            SizedBox(height:15),
            CustomTextField(
              hint: 'Enter your Password',
              icon: Icons.lock,
            ),
            SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                onPressed: (){

               if  ( _key.currentState.validate()){
                  Navigator.of(context).pushNamed(MainProductScreen.routeName);
               }
                },
                color: Colors.black,
                 child: 
              Text(
                'login',
              style: TextStyle(
                color:Colors.white
              ),)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text('Don\t have an account?',
                style: TextStyle(

                  color:Colors.black,
                  fontSize:18
                ),
                ),
                SizedBox(height:50),
                GestureDetector(
                  onTap: (){
                     Navigator.of(context).pushNamed(SignUp.routeName);
                  },
                                child: Text(
                    'Sign Up',
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

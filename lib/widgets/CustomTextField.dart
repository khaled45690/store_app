import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  String _errorMessage(String str){
    switch(hint)
    {
      case 'Enter your name' : return 'Name is required';
      case 'Enter your email' : return 'email is empty';
      case 'Enter your Password' : return 'password is required';
      case 'Confirm Password' : return 'password is empty';
      case 'Enter your email' : return 'Name is empty';


      
    }
  }
  CustomTextField({this.hint,this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextFormField(
        validator:(value){
          if(value.isEmpty)
          {
            return _errorMessage(hint);
          }
        },
        decoration:InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          filled: true, 
          fillColor: Colors.blue,
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color:Colors.white
            )
          ),
          focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color:Colors.white
            )
          ),
        )
      ),
    );
  }
}
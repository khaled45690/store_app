import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final  onchange;
     FormFieldSetter<String> onSaved;
         ValueChanged<String> onFieldSubmitted;
         FocusNode focusNode;
         TextInputType keyboardType;
          TextEditingController controller;



  CustomTextField({@required this.hint, this.icon , @required this.onchange(String value),this.onSaved,this.onFieldSubmitted,this.focusNode,this.keyboardType,this.controller});
  String _errorMessage(String str){
    switch(hint)
    {
      case 'Enter your name' : return 'Name is required';
      case 'Enter your email' : return 'email is empty';
      case 'Enter your Password' : return 'password is required';
      case 'Confirm Password' : return 'password is empty';
      case 'name of product' : return 'Name is empty';
      case 'description of product' : return 'description is empty';
      case  'category of product' : return 'category is empty';
      case 'quatatiy of product' : return 'quatatiy is empty';
     


      default : return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextFormField(
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
        onChanged: (value){
          this.onchange(value);
        },
        validator:(value){
          if(value.isEmpty)
          {
            return _errorMessage(hint);
          }else{
            return null;
          }
        },
        decoration:InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.white,
            
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
        ),
        onSaved: onSaved ,
        onFieldSubmitted: onFieldSubmitted   ,
        focusNode: focusNode,
        keyboardType: keyboardType,
        controller: controller,
        
      ),
    );
  }
}
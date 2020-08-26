

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/CustomTextField.dart';


class AdminEditProduct extends StatefulWidget {
  static const routeName ='/edit-prod';

  @override
  _AdminEditProductState createState() => _AdminEditProductState();
}

class _AdminEditProductState extends State<AdminEditProduct> {
  final _priceFocusNode =FocusNode();
  final _descriptionFocusNode =FocusNode();
  final _quantityFocusNode =FocusNode();
  final _categortFocusNode = FocusNode();
  final _name = TextEditingController();
    final _price =TextEditingController();
  final _description =TextEditingController();
  final _quantity=TextEditingController();
  final _categort = TextEditingController();
      final  _key = GlobalKey<FormState>();

      var _editProduct =Product(
      id: null,
      name: '',
      price: 0,
      description: '',
      quantity: 0,
      category: '',
      imageUrl: ''
      );

  
      @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _categortFocusNode.dispose();
    _quantityFocusNode.dispose();
    _price.dispose();
    _description.dispose();
    _categort.dispose();
    _quantity.dispose();

    super.dispose();
  }
  


          void  _saveForm(){
     final isValid =   _key.currentState.validate();
     if(isValid){
       return;
     }
        _key.currentState.save();
        Provider.of<Products>(context, listen: false).addProduct(_editProduct);
        Navigator.of(context).pop();
        
        print(_editProduct.name);
        print(_editProduct.price);
        print(_editProduct.description);
        print(_editProduct.quantity);
        print(_editProduct.category);
      }
      @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title:Text("Edit Product"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),
           onPressed: _saveForm
           )

           
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:75),
        child: Form(
          key: _key,
          child: ListView(children: <Widget>[

            CustomTextField(
              hint: 'name of product',
              controller: _name,
              onSaved: (value){
                _editProduct =Product(
                  id: null,
                  name: value,
                  price: _editProduct.price,
                  description: _editProduct.description,
                  imageUrl: _editProduct.imageUrl,
                  quantity: _editProduct.quantity,
                  category: _editProduct.category
                  );
              },
              onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
              ),
              SizedBox(height:20),
               CustomTextField(
              hint: 'description of product',
              controller: _description,
              focusNode:  _descriptionFocusNode,
               onSaved: (value){
                _editProduct =Product(
                  id: null,
                  name: _editProduct.name,
                  price: _editProduct.price,
                  description: value,
                  imageUrl: _editProduct.imageUrl,
                  quantity: _editProduct.quantity,
                  category: _editProduct.category
                  );
                
               },
                   onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_priceFocusNode);
               }
              
              ),
                            SizedBox(height:20),

               CustomTextField(
              hint: 'price of product',
              controller: _price,
              keyboardType: TextInputType.number,
              focusNode: _priceFocusNode,
              
                     onSaved: (value){
                _editProduct =Product(
                  id: null,
                  name: _editProduct.name,
                  price: double.parse(value),
                  description: _editProduct.description,
                  imageUrl: _editProduct.imageUrl,
                  quantity: _editProduct.quantity,
                  category: _editProduct.category
                  );
               },
                 onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_categortFocusNode);
              },
               
              ),
                            SizedBox(height:20),

               CustomTextField(
              hint: 'category of product',
              controller: _categort,
              focusNode: _categortFocusNode,
                     onSaved: (value){
                _editProduct =Product(
                  id: null,
                  name: _editProduct.name,
                  price: _editProduct.price,
                  description: _editProduct.description,
                  imageUrl: _editProduct.imageUrl,
                  quantity: _editProduct.quantity,
                  category: value
                  );
               } , onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_quantityFocusNode);
              },
              ),
                             SizedBox(height:20),

               CustomTextField(
              controller: _quantity,
              hint: 'quatatiy of product',
              keyboardType: TextInputType.number, 
              focusNode: _quantityFocusNode,
                     onSaved: (value){
                _editProduct =Product(
                  id: null,
                  name: _editProduct.name,
                  price: _editProduct.price,
                  description: _editProduct.description,
                  imageUrl: _editProduct.imageUrl,
                  quantity: int.parse(value),
                  category: _editProduct.category
                  );
               }
              ),

        ],)),
      ),
      
    );
    
  }
  
}
import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';

class Payment_Screen extends StatefulWidget {
    static const routeName = '/Payment-Screen';

  @override
  _Payment_ScreenState createState() => _Payment_ScreenState();
}

class _Payment_ScreenState extends State<Payment_Screen> {

  String cardNumber ='';
  String expiredDate="";
  String cardHolderName ='';
  String cvCode ='';
  bool isCvFocused =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:
      SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(cardNumber: cardNumber,
             expiryDate: expiredDate,
              cardHolderName: cardHolderName,
               cvvCode: cvCode, 
               showBackView: isCvFocused,
               height: 200,
               width: MediaQuery.of(context).size.width,
               animationDuration: Duration(milliseconds:1000)
               ,),
               new OutlineButton(
                 child: Text(
                   'Process to pay',
                   style: TextStyle(color:Colors.blue
                   ),
                 ),
                 
                 onPressed: null,
                 shape: new RoundedRectangleBorder(
                   borderRadius:BorderRadius.circular(30
                   )
                 ) 
                 ,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: CreditCardForm(
                          onCreditCardModelChange: onModelChange
                        )
                      ))

          ],
        ))
      
    );
  }
      void onModelChange(CreditCardModel model){
        setState(() {
          cardNumber = model.cardNumber;
          expiredDate =model.expiryDate;
          cardHolderName = model.cardHolderName;
          cvCode =model.cvvCode;
          isCvFocused =model.isCvvFocused;
        });

      }

}
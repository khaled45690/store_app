import 'package:flutter/material.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/ReusableCartCardWidget.dart';

class CartWidget extends StatelessWidget {
  static const routeName = '/CartWidget';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F3FF),
        appBar: AppBar(
          title: Text("Cart Screen"),
        ),
        body: Container(
            child:GridView.count(
              crossAxisCount: 1,
              childAspectRatio: (140 / 45),
              children: <Widget>[
                ReusableCartCardWidget(),
                ReusableCartCardWidget(),
                ReusableCartCardWidget(),
                ReusableCartCardWidget(),

                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: CustomButton(text: "purchase products", fontsize: 25,),
                ),
              ],
            ),
        ),
      ),
    );
  }
}

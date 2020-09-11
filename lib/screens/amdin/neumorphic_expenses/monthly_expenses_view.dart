import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/screens/amdin/neumorphic_expenses/pie_chart_view.dart';

import 'categories_row.dart';


class MontlyExpensesView extends StatelessWidget {
    static const routeName ='/Profit-product-chart';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 214, 233, 1),
      body: SafeArea(
        child: Column(
          children: <Widget>[
         //   Spacer(),
            SizedBox(
              height: height * .9,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * 0.065),
                    Text(
                      'Monthly Profit',
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400, fontSize: 30),
                    ),
                    SizedBox(height:80),
                    Expanded(
                      child: 
                      Row(
                        children: <Widget>[
                     //     CategoriesRow(),
                          PieChartView(),
                        ],
                      ),
                      

                    ),
                    Expanded(
                    child:   Row(
                        children: <Widget>[
                          CategoriesRow(),
                        ],
                      ),)
                    
                  ],
                  
                ),
              ),
            )
          ],
        ),
        
      ),
    );
  }
}

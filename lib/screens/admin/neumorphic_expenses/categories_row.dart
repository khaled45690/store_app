import 'package:flutter/material.dart';

import 'pie_chart.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (var category in kCategories)
            ExpenseCategory(
                text: category.name, index: kCategories.indexOf(category),ratio: category.ratio,)
        ],
      ),
    );
  }
}

class ExpenseCategory extends StatelessWidget {
  const ExpenseCategory({
    Key key,
    @required this.index,
    @required this.text,
    @required this.ratio,

  }) : super(key: key);

  final int index;
  final String text;
  final double ratio;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        children: <Widget>[
          Container(
            width: 20,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:  kNeumorphicColors.elementAt(index % kNeumorphicColors.length),
            ),
          ),
          SizedBox(width: 20),
          Text(text.capitalize(),style: TextStyle(fontSize:20),),
          SizedBox(width: 20),
          Text(ratio.toString() +'%',style: TextStyle(fontSize:20),),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

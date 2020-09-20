import 'dart:math';

import 'package:flutter/material.dart';

class PieChart extends CustomPainter {
  PieChart({@required this.categories, @required this.width});

  final List<Category> categories;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 2;

    double total = 0;
    // Calculate total amount from each category
    categories.forEach((expense) => total += expense.amount);

    // The angle/radian at 12 o'clcok
    double startRadian = -pi / 2;

    for (var index = 0; index < categories.length; index++) {
      final currentCategory = categories.elementAt(index);
      // Amount of length to paint is a percentage of the perimeter of a circle (2 x pi)
      final sweepRadian = currentCategory.amount / total * 2 * pi;
      // Used modulo/remainder to catch use case if there is more than 6 colours
      paint.color = kNeumorphicColors.elementAt(index % categories.length);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadian,
        sweepRadian,
        false,
        paint,
      );
      // The new startRadian starts from where the previous sweepRadian.
      // Example, a circle perimeter is 10.
      // Category A takes a startRadian 0 and ends at sweepRadian 5.
      // Category B takes the startRadian where Category A left off, which is 5
      // and ends at sweepRadian 7.
      // Category C takes the startRadian where Category B left off, which is 7
      // and so on.
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Category {

  final String name;
    final double ratio;
  final double amount;
    Category(this.name, this.ratio, {@required this.amount} );

    
    
    //double total = profit + adv +franchise;
    


}
double profit =500;
    double adv=120;
    double franchise=180;
        double total = profit + adv +franchise;

final kCategories = [
  Category('Profit from Products', (profit/total * 100),amount: profit),
  Category('Profit from advirtising',(adv/total*100), amount: adv),
  Category('Profit from franchisee',(franchise/total*100), amount: franchise),
];

final kNeumorphicColors = [
  Colors.blue,
  Colors.green, 
  Colors.red, 

];

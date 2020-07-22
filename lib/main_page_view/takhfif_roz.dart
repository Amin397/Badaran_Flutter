import 'package:flutter/material.dart';

class DayDiscount extends StatefulWidget {
  @override
  _DayDiscountState createState() => _DayDiscountState();
}

class _DayDiscountState extends State<DayDiscount> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Text('تخفیف های روز'),
      ),
    );
  }
}

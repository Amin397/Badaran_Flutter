import 'package:flutter/material.dart';

class ItemDetailsClick extends StatefulWidget {
  String parentName;
  String switchName;
  ItemDetailsClick(this.switchName, this.parentName);

  @override
  _ItemDetailsClickState createState() => _ItemDetailsClickState();
}

class _ItemDetailsClickState extends State<ItemDetailsClick> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffff5a47),
          title: Text('${widget.parentName} / ${widget.switchName}'),
        ),
        body: Container(

        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Transactions{
  String price;
  String date;
  String factoreNum;
  String euroPrice;

  Transactions({this.price, this.date, this.factoreNum, this.euroPrice});

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
    price: json["Fp"],
    date: json["Pn"],
    factoreNum: json["Pb"],
    euroPrice: json["Cb"],
  );
}
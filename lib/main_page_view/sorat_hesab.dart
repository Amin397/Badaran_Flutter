import 'dart:convert';
import 'dart:core';
import 'package:baderan/model/sorathesab_model.dart';
import 'package:baderan/other/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:load/load.dart';

class Bills extends StatefulWidget {
  @override
  _BillsState createState() => _BillsState();
}

class BillsDet {
  String price;
  String date;
  String billNum;
  String euroPrice;

  BillsDet(this.price, this.date, this.billNum, this.euroPrice);
}

class _BillsState extends State<Bills> {
//  List<Transactions> transactions = List<Transactions>();
//  List<Transactions> transactions2 = List<Transactions>();
//  List listShow = List();

  List<BillsDet> det = [
    BillsDet('12.000.000', '1398/08/21', '55216', '50.00'),
    BillsDet('12.000.000', '1398/08/21', '55216', '50.00'),
    BillsDet('12.000.000', '1398/08/21', '55216', '50.00'),
    BillsDet('12.000.000', '1398/08/21', '55216', '50.00'),
    BillsDet('12.000.000', '1398/08/21', '55216', '50.00'),
    BillsDet('12.000.000', '1398/08/21', '55216', '50.00'),
  ];

//  Future<Transactions> getList() async {
//    showLoadingDialog();
//    http.Response r = await http
//        .post(API_ROOT, body: {'target': 'reqPart', 'typeOfCar_id': '4'});
//    if (r.statusCode == 200) {
//      Map<String, dynamic> b = jsonDecode(r.body);
//      List<Transactions> listP2 = List<Transactions>();
//      for (var item in b['product']) {
//        listP2.add(Transactions.fromJson(item));
//      }
//      setState(() {
//        transactions.addAll(transactions2);
//      });
//      select(0);
//      hideLoadingDialog();
//    }
//  }
//
//  void select(catId) {
//    setState(() {
//      listShow.clear();
//      for (Transactions i in transactions) {
//        listShow.add(i);
//      }
//    });
//  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * .05),
            width: size.width,
            height: size.height * .1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'تراکنش ها ',
                style: TextStyle(
                  color: Colors.black , fontSize: 18.0,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: det.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .05,
                        vertical: size.height * .011),
                    child: trans(context , det , size , index),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget trans(context, det , size , index){
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: Colors.white,
      child: Container(
        width: size.width,
        height: size.height * .18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  left: size.width * .03,
                  right: size.width * .03,
                  top: ((size.height * .18) * .5) * .1),
              width: size.width,
              height: (size.height * .18) * .5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('مبلغ' , style: TextStyle(
                      fontSize: 12.0
                  ),),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(det[index].price , style: TextStyle(fontSize: 18.0 , fontWeight: FontWeight.w600),),
                        Text(det[index].date , style: TextStyle(
                            height: 1,
                            fontSize: 10.0
                        ),),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(height: 1,),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    left: size.width * .03,
                    right: size.width * .03,
                    top: ((size.height * .18) * .5) * .1),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('شماره فاکتور: ' , style: TextStyle(
                              fontSize: 10.0
                          ),),
                          Text(det[index].billNum),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('مبلغ یورو: ' , style: TextStyle(
                              fontSize: 10.0
                          ),),
                          Text(det[index].euroPrice),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

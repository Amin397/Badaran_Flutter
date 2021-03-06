import 'dart:convert';

import 'package:baderan/model/card_model.dart';
import 'package:baderan/other/const.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:http/http.dart' as http;

class CardManagement extends StatefulWidget {
  @override
  _CardManagementState createState() => _CardManagementState();
}

class _CardManagementState extends State<CardManagement> {
  List<CardModel> cardList = List<CardModel>();
  List listShow = List();

  List<Cards> cards = [
    Cards('assets/images/melat_bank_log.png', 'بانک ملت', '6273 8111 2054 0734',
        false),
    Cards('assets/images/melli_bank_logo.png', 'بانک ملی',
        '6273 8111 2054 0734', true),
  ];

  Future<CardManagement> getList() async {
    showLoadingDialog();
    http.Response r = await http
        .post(API_ROOT, body: {
          'target': 'reqPart',
      'typeOfCar_id': '4'});
    if (r.statusCode == 200) {
      Map<String, dynamic> b = jsonDecode(r.body);
      List<CardModel> cardList2 = List<CardModel>();
      for (var item in b['product']) {
        cardList2.add(CardModel.fromJson(item));
      }

      setState(() {
        cardList.addAll(cardList2);
      });
      select(0);
      hideLoadingDialog();
    }
  }

  void select(catId) {
    setState(() {
      listShow.clear();
      for (CardModel i in cardList) {
        listShow.add(i);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          backgroundColor: Color(0xff00a5b8),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[200],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .03, vertical: size.height * .01),
          height: size.height,
          width: size.width,
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'مدیریت کارت',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
              ),
              Expanded(
                flex: 1,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: size.height * .02),
                      height: size.height * .6,
                      child: ListView.builder(
                        itemCount: cards.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: size.width * .04,
                                right: size.width * .04,
                                bottom: size.height * .03),
                            child: _buildCardsItems(context, index),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardsItems(context, index) {
    var size = MediaQuery.of(context).size;
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      color: Colors.white,
      child: Container(
        height: size.height * .15,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: size.width * .1,
                  height: size.height,
                  decoration: BoxDecoration(
                      color: (cards[index].taaid_shode)
                          ? Colors.green
                          : Colors.redAccent,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0))),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        (cards[index].taaid_shode) ? 'تایید شده' : 'تایید نشده',
                        style: TextStyle(
                            fontSize: 10.0,
                            height: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * .02,
                ),
                Container(
                  height: size.height,
                  width: size.width * .2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: Image.asset(cards[index].image_path).image)),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  cards[index].bank_name,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(cards[index].card_number),
              ],
            ),
            Container(
              height: size.height,
              width: size.width * .15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.clear,
                      size: 20.0,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      _showMyDialog(index);
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: (size.width * .15) * .1,
                        bottom: (size.height * .15) * .05),
                    width: size.width * .15,
                    height: (size.height * .15) * .2,
                    decoration: BoxDecoration(
                        color: Color(0xff00a5b8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Center(
                      child: Text(
                        'اعتبار سنجی',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.0,
                          height: 1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Icon(Icons.warning , color: Colors.amber.shade800, size: 60.0,),
          ),
          content: SingleChildScrollView(
            child: Center(
              child: Text('آیا از حذف کارت مطمعنید ؟'),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('بله'),
              onPressed: () {
                setState(() {
                  cards.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('خیر'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}

class Cards {
  String image_path;
  String bank_name;
  String card_number;
  bool taaid_shode;

  Cards(this.image_path, this.bank_name, this.card_number, this.taaid_shode);
}

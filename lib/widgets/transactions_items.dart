import 'package:baderan/model/sorathesab_model.dart';
import 'package:flutter/material.dart';

class TransActionsItems extends StatefulWidget {

  Transactions items;
  TransActionsItems(this.items);

  @override
  _TransActionsItemsState createState() => _TransActionsItemsState();
}

class _TransActionsItemsState extends State<TransActionsItems> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
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
                        Text(widget.items.price , style: TextStyle(fontSize: 18.0 , fontWeight: FontWeight.w600),),
                        Text(widget.items.date , style: TextStyle(
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
                          Text(widget.items.factoreNum),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('مبلغ یورو: ' , style: TextStyle(
                              fontSize: 10.0
                          ),),
                          Text(widget.items.euroPrice),
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

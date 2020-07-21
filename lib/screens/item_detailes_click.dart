import 'package:flutter/material.dart';

class ItemDetailsClick extends StatefulWidget {
  String parentName;
  String switchName;

  ItemDetailsClick(this.switchName, this.parentName);

  @override
  _ItemDetailsClickState createState() => _ItemDetailsClickState();
}

class listDetails {
  String imagePath;
  String name;
  String description;

  listDetails(this.imagePath, this.name, this.description);
}

class _ItemDetailsClickState extends State<ItemDetailsClick> {
  ScrollController _scrollController;

  List<listDetails> listDet = [
    listDetails('assets/images/coffee_logo.png', 'کافه رومانو',
        'کافه بین المللی رومانو با سابقه 4 ساله در راستای ارائه خدمات به مشتریان و عزیزان خود توانسته اعتماد زیادی را بین مشترین خود کسب کند'),
    listDetails('assets/images/coffee_logo.png', 'کافه رومانو',
        'کافه بین المللی رومانو با سابقه 4 ساله در راستای ارائه خدمات به مشتریان و عزیزان خود توانسته اعتماد زیادی را بین مشترین خود کسب کند'),
    listDetails('assets/images/coffee_logo.png', 'کافه رومانو',
        'کافه بین المللی رومانو با سابقه 4 ساله در راستای ارائه خدمات به مشتریان و عزیزان خود توانسته اعتماد زیادی را بین مشترین خود کسب کند'),
    listDetails('assets/images/coffee_logo.png', 'کافه رومانو',
        'کافه بین المللی رومانو با سابقه 4 ساله در راستای ارائه خدمات به مشتریان و عزیزان خود توانسته اعتماد زیادی را بین مشترین خود کسب کند'),
    listDetails('assets/images/coffee_logo.png', 'کافه رومانو',
        'کافه بین المللی رومانو با سابقه 4 ساله در راستای ارائه خدمات به مشتریان و عزیزان خود توانسته اعتماد زیادی را بین مشترین خود کسب کند'),
    listDetails('assets/images/coffee_logo.png', 'کافه رومانو',
        'کافه بین المللی رومانو با سابقه 4 ساله در راستای ارائه خدمات به مشتریان و عزیزان خود توانسته اعتماد زیادی را بین مشترین خود کسب کند'),
    listDetails('assets/images/coffee_logo.png', 'کافه رومانو',
        'کافه بین المللی رومانو با سابقه 4 ساله در راستای ارائه خدمات به مشتریان و عزیزان خود توانسته اعتماد زیادی را بین مشترین خود کسب کند'),
  ];

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Color(0xffff5a47),
          title: Text('${widget.parentName} / ${widget.switchName}'),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .05, vertical: size.height * .01),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height * .03),
                height: size.height * .2,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset('assets/images/baner1.jpg').image)),
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(vertical: size.height * .01),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: _scrollController,
                    itemCount: listDet.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: size.width * .05,
                            right: size.width * .05,
                            bottom: size.height * .03),
                        child: InkWell(
                          onTap: (){

                          },
                          child: _buildListViewIcons(context, index),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListViewIcons(context, index) {
    var size = MediaQuery.of(context).size;

    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)),
      child: Container(
        height: size.height * .15,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0))),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              width: size.width * .27,
              height: size.height,
              child: Center(
                child: Image.asset(
                  listDet[index].imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('کافه ${widget.switchName}' , style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600
                    ),),
                    Divider(),
                    Text(
                      listDet[index].description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 10.0
                      ),
                    ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDetailScreen extends StatefulWidget {
  String name;
  String imagePath;
  String description;

  MainDetailScreen(this.name, this.imagePath, this.description);

  @override
  _MainDetailScreenState createState() => _MainDetailScreenState();
}

class _MainDetailScreenState extends State<MainDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xffff5a47),
          title: Text(widget.name),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .03, vertical: size.height * .015),
          color: Colors.grey[200],
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildContainer(size),
              _buildImageDescription(size),
              Divider(),
              Text('توضیحات' , style: TextStyle(color: Colors.black54 , fontSize: 12.0),),
              Padding(
                padding: EdgeInsets.only(right: size.width * .05 , top: 5.0),
                child: Text(
                  widget.description,
                  style: TextStyle(fontSize: 1.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(size.width * .05),
                child: _buildLocationContainer(size),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationContainer(size){
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      child: Container(
        height: size.height * .1,
        width: size.width * .2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.location_on , color: Color(0xff00a5b8),size: 30.0,),
            Text('موقعیت' , style: TextStyle(
              color: Color(0xff00a5b8),
              fontWeight: FontWeight.w600
            ),)
          ],
        ),
      ),
    );
  }

  Widget _buildImageDescription(size) {
    return Container(
      height: size.height * .15,
      width: size.width,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            width: size.width * .27,
            height: size.height,
            child: Center(
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                ' ${widget.name}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContainer(size) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        width: size.width,
        height: size.height * .25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.orangeAccent,
        ),
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(size.width * .03),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    child: Container(
                      height: (size.height * .2) * .4,
                      width: size.width * .15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        color: Colors.redAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '%25',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0),
                          ),
                          Text(
                            'تخفیف',
                            style: TextStyle(
                              color: Colors.white,
                              height: 1,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: (size.height * .25) * .5,
                child: Image.asset(
                  'assets/images/cup_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

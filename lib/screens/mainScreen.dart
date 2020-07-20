import 'package:baderan/other/zoom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ChangeNotifierProvider(
        builder: (context) => menuController,
        child: ZoomScaffold(
          menuScreen: MenuScreen(),
          contentScreen: Layout(
              contentBuilder: (cc) => Container(
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(horizontal: size.width * .03 , vertical: size.height * .005),
                child: Container(
                  color: Colors.grey[200],
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * .02 , top: size.height * .007),
                        child: _userInformation(context , size),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * .02),
                        child: _accountAmountInformation(context , size),
                      ),
                      _gridMainItems(context , size),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Widget _gridMainItems(context , size){
    return Expanded(
      child: Container(
        
      ),
    );
  }

  Widget _accountAmountInformation(context , size){
    return Material(
      elevation: 5.0,
      color: Color(0xff00a5b8),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * .05),
        height: size.height * .06,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('مانده اعتبار: ' , style: TextStyle(
                color: Colors.white70,
                fontFamily: 'IRANSans',
                fontSize: 12.0
              ),),
              Text('120.000.000 ' , style: TextStyle(
                color: Colors.white ,
                fontFamily: 'IRANSans',
                fontWeight: FontWeight.w500,
                fontSize: 18.0
              ),),
              Text(' تومان' , style: TextStyle(
                fontFamily: 'IRANSans',
                color: Colors.white
              ),),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userInformation(context , size){
    return Material(
      elevation: 5.0,
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        height: size.height * .12,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              width: size.width * .25,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.black26 , spreadRadius: 1.2 , blurRadius: 5.0
                )],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white , width: 2.0),
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: Image.asset('assets/images/avatar.png').image
                )
              ),
            ),
            Expanded(
              child: Container(
                width: size.width * .75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('یونس نادری' , style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontFamily: 'IRANSans'
                    ),),
                    Row(
                      children: <Widget>[
                        Text('کد عضویت: ' , style: TextStyle(
                          fontFamily: 'IRANSans',
                          fontSize: 10.0,
                          color: Colors.black38
                        ),),
                        Text('ba45124845' , style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'IRANSans',

                        ),),
                      ],
                    )
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

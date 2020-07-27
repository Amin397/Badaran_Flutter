import 'package:baderan/functions.dart';
import 'package:baderan/other/const.dart';
import 'package:baderan/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:load/load.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SignInScreen(),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool checked = false;

  TextEditingController national_code = TextEditingController();
  TextEditingController phone_Number = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Material(
      child: Container(
        child: Stack(
          overflow: Overflow.clip,
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(top: size.height * .05),
                width: size.width,
                height: size.height * .35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset('assets/images/signin_login.jpg')
                            .image)),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: (size.width * .35) * .05),
                        width: size.width * .18,
                        height: (size.height * .35) * .25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset('assets/images/logo.png')
                                    .image)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'بادران لایــف',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                          Text(
                            'BAADRAAN LIFE',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Container(
                      width: size.width,
                      height: size.height * .7,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5.0,
                                spreadRadius: 1.0)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * .05,
                            vertical: (size.height * .7) * .05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'ثبت نام',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20.0),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: (size.height * .7) * .05),
                              width: size.width,
                              height: (size.height * .7) * .1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue.shade100,
                                        spreadRadius: 2,
                                        blurRadius: 6.0)
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              child: Center(
                                child: TextField(
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  controller: national_code,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'کد ملی',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0
                                      )),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: (size.height * .7) * .05),
                              width: size.width,
                              height: (size.height * .7) * .1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue.shade100,
                                        spreadRadius: 2,
                                        blurRadius: 6.0)
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              child: Center(
                                child: TextField(
                                  maxLength: 11,
                                  maxLines: 1,
                                  controller: phone_Number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'شماره موبایل',
                                      hintStyle: TextStyle(
                                        fontSize: 14.0,
                                          color: Colors.grey, height: 1)),
                                ),
                              ),
                            ),
                            Divider(
                              height: 5,
                              color: Colors.black26,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {
                                            if(!checked){
                                              _controller
                                                ..duration = Duration(seconds: 3)
                                                ..forward();
                                            }else{
                                              _controller
                                                ..duration = Duration(seconds: 3)
                                                ..reverse();
                                            }
                                            checked = !checked;
                                            print(checked);
                                          });
                                        },
                                        child: Lottie.asset('assets/anim/checked.json',
                                          controller: _controller,
                                          fit: BoxFit.cover,
                                          repeat: false,
                                        ),
                                      ),
                                    ),
                                    Text('قوانین مورد تایید میباشد !' , style: TextStyle(
                                      color: Colors.black ,
                                      fontSize: 14.0
                                    ),),
                                  ],
                                ),
                                FlatButton(
                                  onPressed: (){

                                  },
                                  child: Center(
                                    child: Text('قوانین و مقررات' , style: TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 10.0
                                    ),),
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              height: 5,
                              color: Colors.black26,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: (size.height * .7) * .1),
                              child: RaisedButton(
                                onPressed: (){
                                  showLoadingDialog();
                                  makePostRequest(
                                      'http://demo.offerlee.ir/Customers/API/signin?token=test',
                                      {
                                        'nationalcode': national_code.text,
                                        'phone': phone_Number.text,
                                        'fname': 'یونس ',
                                        'lname': 'نادری',
                                        'logic': (checked)? 1 : 0
                                      }).then((value) async {
                                    if(value['status'] == 'success'){
                                      setPref('fname', value['customer_fname']);
                                      setPref('lname', value['customer_lname']);
                                      hideLoadingDialog();
                                      Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.upToDown, child: LoginPage()));
                                    }else{
                                      hideLoadingDialog();
                                      print('amin');
                                      print(phone_Number.text);
                                    }
                                  });
                                },
                                splashColor: Colors.white,
                                color: Colors.blue.shade400,
                                child: Center(
                                  child: Text('تکمیل ثبت نام' , style: TextStyle(
                                    color: Colors.white , fontWeight: FontWeight.w600
                                  ),),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:baderan/functions.dart';
import 'package:baderan/screens/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:page_transition/page_transition.dart';
import 'mainScreen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                                  maxLines: 1,
                                  controller: username,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'نام کاربری',
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
                                  maxLines: 1,
                                  controller: password,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'رمز عبور',
                                      hintStyle: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey, height: 1)),
                                ),
                              ),
                            ),
                            Divider(),
                            FlatButton(
                              onPressed: (){

                              },
                              child: Text('بازیابی رمز عبور' , style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 12.0
                              ),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: (size.height * .7) * .1 , left: size.width * .1 , right:  size.width * .1 ),
                              child: RaisedButton(
                                onPressed: (){
//                                  showLoadingDialog();
//                                  makePostRequest(
//                                      'http://demo.offerlee.ir/Customers/API/login',
//                                      {
//                                        'username': username.text,
//                                        'password': password.text,
//                                        'token': 'test'
//                                      }).then((value) async {
//                                    if(value['result'] == 'success'){
//                                      hideLoadingDialog();
                                      Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.upToDown, child: MyHomePage()));
//                                    }else{
//                                      hideLoadingDialog();
//                                      print('amin');
//                                    }
//                                  });
                                },
                                splashColor: Colors.white,
                                color: Colors.blue.shade400,
                                child: Center(
                                  child: Text('ورود' , style: TextStyle(
                                      color: Colors.white , fontWeight: FontWeight.w600
                                  ),),
                                ),
                              ),
                            ),
                            Divider(),
                            Center(
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.upToDown, child: SignInPage()));
                                },
                                child: Text('عضویت در باشگاه' , style: TextStyle(
                                  color: Color(0xff00a5b8),
                                  fontWeight: FontWeight.bold
                                ),),
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

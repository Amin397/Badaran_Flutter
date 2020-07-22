import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCodeScanner extends StatefulWidget {
  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner>
    with TickerProviderStateMixin {
  AnimationController anim_controller;

  @override
  void initState() {
    super.initState();

    anim_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  String qrScanner = '';

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .04, vertical: size.height * .01),
      height: size.height,
      width: size.width,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              qrScanner,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 200.0,
              width: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      String scanning = await BarcodeScanner.scan();
                      setState(() {
                        qrScanner = scanning;
                        _launchURL();
                        print(qrScanner.toString());
                      });
                    },
//                    onTap: (){
////                      Navigator.push(
////                          context,
////                          PageTransition(
////                              type: PageTransitionType.upToDown, child: QrScanner()));
//                    },
                    child: Material(
                      elevation: 5.0,
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: size.width,
                            height: size.height * .3,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 100.0,
                                  width: 100.0,
                                  child: Lottie.asset(
                                      'assets/anim/qr_code.json',
                                      repeat: true,
                                      controller: anim_controller),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text('برای اسکن کد ضربه بزنید !')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

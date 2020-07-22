import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class QrScanner extends StatefulWidget {
  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {

  var qrScanner ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('result'),
            FlatButton(
              child: Text('Scan'),
            )
          ],
        ),
      ),
    );
  }
}

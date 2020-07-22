import 'package:flutter/material.dart';

class VsWallet extends StatefulWidget {
  @override
  _VsWalletState createState() => _VsWalletState();
}

class _VsWalletState extends State<VsWallet> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Text('کیف پول'),
      ),
    );
  }
}

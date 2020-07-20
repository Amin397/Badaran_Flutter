import 'package:baderan/other/zoom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {

  final List<MenuItem> options = [
    MenuItem(Icons.search, 'Search'),
    MenuItem(Icons.shopping_basket, 'Basket'),
    MenuItem(Icons.favorite, 'Discounts'),
    MenuItem(Icons.code, 'Prom-codes'),
    MenuItem(Icons.format_list_bulleted, 'Orders'),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx > 0) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.only(
              top: 62,
              right: 32,
              bottom: 8,
              left: MediaQuery.of(context).size.width / 2.9),
          color: Color(0xff454dff),
          child: Column(
            children: <Widget>[
              Spacer(),
              Column(
                children: options.map((item) {
                  return ListTile(
                    leading: Icon(
                      item.icon,
                      color: Colors.white,
                      size: 20,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
              Spacer(),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text('Settings',
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.headset_mic,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text('Support',
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}

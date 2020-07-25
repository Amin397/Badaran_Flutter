import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:requests/requests.dart';

import 'other/const.dart';

//Future<Map> loginExpert(username, password, token , imei) async {
//  print(username);
//  var res = await makePostRequestLogin(API_ROOT , {
//    'target': 'login',
//    'username': username.toString().trim(),
//    'password': password.toString().trim(),
//    'ft': token,
//    'imei': imei
//  }
//  );
//  return res.json();
//}

// ignore: non_constant_identifier_names
Future<Map> GetExpert(expertId) async {
  var res = await makePostRequest(API_ROOT + '/BaseInfo/Experts/Experts.php',
      {'expert_id': expertId, 'api_type': 'get'});
  return res;
}

Future<void> setPref(name, pref) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(name, pref);
}

Future<String> getPref(name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(name);
}

Future<dynamic> makePostRequest(String API,Map params) async {
//  params['token'] = '199d2addf2da5116b1accafcf4685f128df2ca69';
  var res = await Requests.post(API, body: params);
  return res.json();
}

//Future<PermissionStatus> _getLocationPermission() async {
//  final PermissionStatus permission = await LocationPermissions()
//      .checkPermissionStatus(level: LocationPermissionLevel.location);
//  if (permission != PermissionStatus.granted) {
//    final PermissionStatus permissionStatus = await LocationPermissions()
//        .requestPermissions(permissionLevel: LocationPermissionLevel.location);
//
//    return permissionStatus;
//  } else {
//    return permission;
//  }
//}

//Future<dynamic> getLocation() async {
//  final PermissionStatus permission = await _getLocationPermission();
//  print(await _getLocationPermission());
//  if (permission == PermissionStatus.granted) {
//    final position = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
//    return position;
//  }
//
////  print(await Geolocator().checkGeolocationPermissionStatus());
////  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
////  return position;
//}

void showInSnackBar(
    BuildContext context, String value, Color color, int secs, _scaffoldKey) {
  FocusScope.of(context).requestFocus(new FocusNode());
  _scaffoldKey.currentState?.removeCurrentSnackBar();
  _scaffoldKey.currentState.showSnackBar(new SnackBar(
    content: new Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 16.0, fontFamily: "IRANSans"),
    ),
    backgroundColor: color,
    duration: Duration(seconds: secs),
  ));
}

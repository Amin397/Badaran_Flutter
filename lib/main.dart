import 'file:///I:/test_proj/baderan/lib/other/loading.dart';
import 'package:baderan/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:load/load.dart';
import 'package:overlay_support/overlay_support.dart';
import 'other/const.dart';
import 'screens/splash_screen.dart';

void main(){
  runApp(
      LoadingProvider(
        loadingWidgetBuilder: (ctx, data) {
          return Loading();
        },
        child: OverlaySupport(
            child: HomePage()
        ),
      )
  );
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IRANSans'
      ),
      routes: <String , WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        SIGN_IN: (BuildContext context) => SignInPage(),
//        SIGN_UP:(BuildContext context) => SignUp()
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}


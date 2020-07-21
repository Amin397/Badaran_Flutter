import 'package:baderan/other/zoom_scaffold.dart';
import 'package:baderan/screens/item_details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'menu_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MenuController menuController;
  PageController pageController;

  final _currentPageNotifier = ValueNotifier<int>(0);
  List<String> texts = [
    'تفریح و سرگرمی',
    'پوشاک',
    'هایپرمارکت',
    'رستوران',
    'کافه',
    'ورزشی',
    'مذهبی',
    'خرید',
    'شهر بازی',
  ];

  List<Icon> icons = <Icon>[
    Icon(
      Icons.videogame_asset,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.highlight,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.forward,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.zoom_out_map,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.zoom_out,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.dashboard,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.assignment,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.account_balance,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.list,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
  ];

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));

    pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
//    menuController.dispose();
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
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .03,
                        vertical: size.height * .005),
                    child: Container(
                      color: Colors.grey[200],
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: size.height * .02,
                                top: size.height * .007),
                            child: _userInformation(context, size),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: size.height * .02),
                            child: _accountAmountInformation(context, size),
                          ),
                          _gridMainItems(context, size),
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }

  Widget _gridMainItems(context, size) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: pageController,
                itemCount: 3,
                onPageChanged: (int indexP) {
                  _currentPageNotifier.value = indexP;
                },
                itemBuilder: (BuildContext context, int indexP) {
                  return _buildPageView(context, indexP, size);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * .05,
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotHeight: 10.0,
                      dotWidth: 10.0,
                      dotColor: Color(0xff00a5b8),
                      activeDotColor: Color(0xffff5a47)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageView(context, indexP, size) {
    return Container(
      child: Center(
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10),
          itemBuilder: (_, indexG) => _buildItemsOfGridView(indexG, size),
          itemCount: 9,
        ),
      ),
    );
  }

  Widget _buildItemsOfGridView(indexG, size) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.upToDown,
                child: ItemsDetails(texts[indexG], icons[indexG])));
      },
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(size.width * .01),
            height: size.height * .12,
            width: size.height * .12,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5.0, spreadRadius: .8)
              ],
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: icons[indexG],
            ),
          ),
          Text(texts[indexG])
        ],
      ),
    );
  }

  Widget _accountAmountInformation(context, size) {
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
              Text(
                'مانده اعتبار: ',
                style: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'IRANSans',
                    fontSize: 12.0),
              ),
              Text(
                '120.000.000 ',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'IRANSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0),
              ),
              Text(
                ' تومان',
                style: TextStyle(fontFamily: 'IRANSans', color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userInformation(context, size) {
    return Material(
      elevation: 5.0,
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        height: size.height * .12,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              width: size.width * .25,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1.2,
                        blurRadius: 5.0)
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.asset('assets/images/avatar.png').image)),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: size.width * .75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'یونس نادری',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          fontFamily: 'IRANSans'),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'کد عضویت: ',
                          style: TextStyle(
                              fontFamily: 'IRANSans',
                              fontSize: 10.0,
                              color: Colors.black38),
                        ),
                        Text(
                          'ba45124845',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'IRANSans',
                          ),
                        ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white54,
        body: Stack(
          children: <Widget>[
            menu(context),
            dashboard(context),
          ],
        ),
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(top: screenHeight * .1),
                    height: screenHeight * .2,
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: (screenHeight * .2) * .6,
                          width: (screenWidth * .55) * .45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white , width: 2.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset('assets/images/avatar.png')
                                      .image)),
                        ),
                        Expanded(
                          child: Container(
                            width: (screenWidth * .45),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                              Text('یونس نادری' , style: TextStyle(
                                color: Colors.white , fontWeight: FontWeight.w600,
                                fontFamily: 'IRANSans',
                                fontSize: 18.0
                              ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('کد عضویت :' , style: TextStyle(
                                    fontFamily: 'IRANSans',
                                    color: Colors.white
                                  ),),
                                  Text('ba231542154' , style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'IRANSans'
                                  ),),
                                ],
                              ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'صفحه اصلی',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Divider(),
                          Text(
                            'پروفایل',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Divider(),
                          Text(
                            'مدیریت کارت',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Divider(),
                          Text(
                            'صورتحساب',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Divider(),
                          Text(
                            'تغییر کلمه عبور',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Divider(),
                          Text(
                            'خروج',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      top: 0,
      bottom: 0,
      right: isCollapsed ? 0 : 0.6 * screenWidth,
      left: isCollapsed ? 0 : -0.3 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: Duration(milliseconds: 400),
          borderRadius: !isCollapsed
              ? BorderRadius.all(Radius.circular(20.0))
              : BorderRadius.all(Radius.circular(0)),
          elevation: 8.0,
          color: Colors.red,
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 48.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (isCollapsed) {
                            _controller.forward();
                          } else {
                            _controller.reverse();
                          }
                          isCollapsed = !isCollapsed;
                        });
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'My Cards',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 36.0,
                ),
                Container(
                  height: 200.0,
                  child: PageView(
                    controller: PageController(viewportFraction: 0.8),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        color: Colors.redAccent,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        color: Colors.blueAccent,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        color: Colors.greenAccent,
                        width: 100,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

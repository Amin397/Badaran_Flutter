import 'package:auto_size_text/auto_size_text.dart';
import 'package:baderan/main_page_view/kharid_bedone_kart.dart';
import 'package:baderan/main_page_view/kif_poll.dart';
import 'package:baderan/main_page_view/sorat_hesab.dart';
import 'package:baderan/main_page_view/takhfif_roz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class ZoomScaffold extends StatefulWidget {
  final Widget menuScreen;
  final Layout contentScreen;

  ZoomScaffold({
    this.menuScreen,
    this.contentScreen,
  });

  @override
  _ZoomScaffoldState createState() => new _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold>
    with TickerProviderStateMixin {

  int currentIndex = 2;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 2);
  }

  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(
        title: Text('کیف پول'), icon: Icons.account_balance_wallet),
    TitledNavigationBarItem(
        title: Text(
          'خریدبدون کارت',
          style: TextStyle(
            fontSize: 11.0
          ),
        ),
        icon: Icons.credit_card),
    TitledNavigationBarItem(title: Text('صفحه اصلی' , style: TextStyle(
        fontSize: 12.0
    ),), icon: Icons.home),
    TitledNavigationBarItem(title: Text('تخفیف روز' , style: TextStyle(
        fontSize: 12.0
    ),), icon: Icons.local_offer),
    TitledNavigationBarItem(title: Text('صورتحساب' , style: TextStyle(
        fontSize: 12.0
    ),), icon: Icons.assignment),
  ];

  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);

  createContentDisplay(context) {
    var size = MediaQuery.of(context).size;

    return zoomAndSlideContent(new Container(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
              backgroundColor: Colors.grey[200],
              elevation: 0.0,
              centerTitle: true,
              title: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset('assets/images/logo.png').image)),
              ),
              leading: new IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Provider.of<MenuController>(context, listen: true).toggle();
                  }),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                )
              ]),
          body: PageView(
            controller: _pageController,
            allowImplicitScrolling: false,
            onPageChanged: (page){
              setState(() {
                currentIndex = page;
              });
            },
            children: <Widget>[
              VsWallet(),
              QrCodeScanner(),
              widget.contentScreen.contentBuilder(context),
              DayDiscount(),
              Bills(),
            ],
          ),
          bottomNavigationBar: TitledBottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
                print(currentIndex);
                onTabTapped(index);
              });
            },
            enableShadow: true,
            reverse: true,
            currentIndex: currentIndex,
            curve: Curves.easeInBack,
            items: items,
            inactiveStripColor: Color(0xff00a5b8),
            indicatorColor: Color(0xffff5a47),
            activeColor: Color(0xffff5a47),
            inactiveColor: Color(0xff00a5b8),
          ),
        ),
      ),
    ));
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(index ,
        curve: Curves.slowMiddle, duration: new Duration(milliseconds: 250));
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;

    switch (Provider.of<MenuController>(context, listen: true).state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = scaleDownCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = scaleUpCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
    }

    final slideAmount = -200.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius =
        16.0 * Provider.of<MenuController>(context, listen: true).percentOpen;

    return new Transform(
      transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: const Offset(0.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: new ClipRRect(
            borderRadius: new BorderRadius.circular(cornerRadius),
            child: content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Scaffold(
            body: widget.menuScreen,
          ),
        ),
        createContentDisplay(context)
      ],
    );
  }
}

class ZoomScaffoldMenuController extends StatefulWidget {
  final ZoomScaffoldBuilder builder;

  ZoomScaffoldMenuController({
    this.builder,
  });

  @override
  ZoomScaffoldMenuControllerState createState() {
    return new ZoomScaffoldMenuControllerState();
  }
}

class ZoomScaffoldMenuControllerState
    extends State<ZoomScaffoldMenuController> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(
        context, Provider.of<MenuController>(context, listen: true));
  }
}

typedef Widget ZoomScaffoldBuilder(
    BuildContext context, MenuController menuController);

class Layout {
  final WidgetBuilder contentBuilder;

  Layout({
    this.contentBuilder,
  });
}

class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;

  MenuController({
    this.vsync,
  }) : _animationController = new AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 400)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return _animationController.value;
  }

  open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  toggle() {
    if (state == MenuState.open) {
      close();
    } else if (state == MenuState.closed) {
      open();
    }
  }
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}

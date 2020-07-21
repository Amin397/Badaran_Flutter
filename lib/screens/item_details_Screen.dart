import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'item_detailes_click.dart';

class ItemsDetails extends StatefulWidget {
  String categorieText;
  Icon categorieIcon;

  ItemsDetails(this.categorieText, this.categorieIcon);

  @override
  _ItemsDetailsState createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails>
    with TickerProviderStateMixin {
  PageController pageController;

  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Color(0xffff5a47),
          title: Text(widget.categorieText),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .05, vertical: size.height * .01),
          height: size.height,
          width: size.width,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height * .03),
                height: size.height * .2,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset('assets/images/baner1.jpg').image)),
              ),
              Container(
                height: size.height * .55,
                width: size.width,
                child: _gridDetailsItems(context, size),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _gridDetailsItems(context, size) {
    return Container(
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
          itemCount: switchText().length,
        ),
      ),
    );
  }

  Widget _buildItemsOfGridView(indexG, size) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: ItemDetailsClick(switchText()[indexG] , widget.categorieText)));
          },
          splashColor: Colors.red,
          child: Container(
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
              child: Text(
                switchText()[indexG],
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff00a5b8),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<String> switchText() {
    switch (widget.categorieText) {
      case 'تفریح و سرگرمی':
        {
          return [
            'اتاق فرار',
            'پینت بال',
            'PS4',
            'زیپ لاین',
            'کافه',
          ];
        }
      case 'پوشاک':
        {
          return [
            'لباس',
            'کفش',
            'جوراب',
            'شلوار',
            'شلوار کتان',
          ];
        }
      case 'هایپرمارکت':
        {
          return [
            'سوپرگوشت',
            'سوپرسبزیجات',
            'سوپرنان',
          ];
        }
      case 'رستوران':
        {
          return [
            'اسپانیایی',
            'ایتالیایی',
            'سنتی',
            'فست فود',
            'سرد',
            'آش فروشی',
          ];
        }
      case 'کافه':
        {
          return [
            'کافه کتاب',
            'کافه رستوران',
            'ایلی',
            'سورن',
            'کاج',
            'شاندیز',
            'ساویز',
            'رومانو',
          ];
        }
      case 'ورزشی':
        {
          return [
            'سالن بعثت',
            'سالن فلق',
            'سالن بهنام',
            'سالن مهر',
            'سالن فرهنگیان',
            'استخرفلق',
            'استخر معلم',
          ];
        }
      case 'شهر بازی':
        {
          return [
            'آشتی',
            'دوستان',
            'ستاره',
          ];
        }
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ctrip/dao/home_dao.dart';
import 'package:flutter_ctrip/widget/grid_nav.dart';
import 'package:flutter_ctrip/widget/local_nav.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'model/common_model.dart';
import 'model/home_model.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg'
  ];

  double appBarAlpha = 0;
  String resultString = '';
  List<CommonModel> localNavList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  loadData() async {
//    HomeDao.fetch().then((result) {
//      setState(() {
//        resultString = json.encode(result);
//      });
//    }).catchError((e) {
//      resultString = e.toString();
//    });
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        localNavList = model.localNavList;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: Stack(
            children: <Widget>[
              NotificationListener(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.depth == 0) {
                      //滚动且是列表滚动的时候
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                    return true;
                  },
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 160,
                        child: Swiper(
                          itemCount: _imageUrls.length,
                          autoplay: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(_imageUrls[index],
                                fit: BoxFit.fill);
                          },
                          pagination: SwiperPagination(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                        child: LocalNav(localNavList: localNavList),
                      ),
                      Container(
                        height: 800,
                        child: ListTile(
                          title: Text(resultString),
                        ),
                      )
                    ],
                  )),
              Opacity(
                opacity: appBarAlpha,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('首页'),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

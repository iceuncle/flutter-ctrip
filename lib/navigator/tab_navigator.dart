import 'package:flutter/material.dart';

import '../home_page.dart';
import '../my_page.dart';
import '../search_page.dart';
import '../travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _currentIndex = 0;

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[HomePage(), SearchPage(), TravelPage(), MyPage()],
        physics: NeverScrollableScrollPhysics(),  //设置不滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomItem(0, '首页', Icons.home),
            _bottomItem(1, '搜索', Icons.search),
            _bottomItem(2, '旅拍', Icons.camera_alt),
            _bottomItem(3, '我的', Icons.account_circle),
          ]),
    );
  }

  _bottomItem(int index, String title, IconData iconData) {
    return BottomNavigationBarItem(
        icon: Icon(iconData), activeIcon: Icon(iconData), title: Text(title));
  }
}

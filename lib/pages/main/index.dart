import 'package:flutter/material.dart';
import 'package:nexus_shop/pages/cart/index.dart';
import 'package:nexus_shop/pages/category/index.dart';
import 'package:nexus_shop/pages/home/index.dart';
import 'package:nexus_shop/pages/mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //define the data to render the navigation bar
  // the data is usually certain
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png", //normal icon
      "active_icon": "lib/assets/ic_public_home_active.png", // active icon
      "text": "首页", //text
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png",
      "active_icon": "lib/assets/ic_public_pro_active.png",
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png",
      "active_icon": "lib/assets/ic_public_cart_active.png",
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png",
      "active_icon": "lib/assets/ic_public_my_active.png",
      "text": "我的",
    },
  ];

  int _currentIndex = 0;

  //define the data to render the navigation bar
  List<BottomNavigationBarItem> _getTabWidget() {
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"]!,
      );
    });
  }

  List<Widget> _getChildWidget() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildWidget()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _getTabWidget(),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

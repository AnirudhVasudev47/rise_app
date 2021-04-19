import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rise/components/main_menu.dart';
import 'package:rise/icons/cards_icons.dart';
import 'package:rise/icons/custom_icons_icons.dart';
import 'package:rise/icons/graph_icons.dart';
import 'package:rise/icons/home_icons.dart';
import 'package:rise/icons/piggy_bank_icons.dart';
import 'package:rise/main_tabs/analytics_tab.dart';
import 'package:rise/main_tabs/home_tab.dart';
import 'package:rise/main_tabs/pay_tab.dart';
import 'package:rise/main_tabs/piggy_bank_tab.dart';
import 'package:rise/main_tabs/virtual_card_tab.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final font = 'ProductSans';
  int _selectedIndex = 0;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    VirtualCardTab(),
    PaymentTab(),
    AnalyticsTab(),
    PiggyBankTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SideMenu(
      key: _endSideMenuKey,
      inverse: false,
      // end side menu
      background: Color(0xffe8e8e8),
      type: SideMenuType.slide,
      menu: SideMainMenu(),
      closeIcon: Icon(
        Icons.close,
        color: Colors.black,
      ),
      child: SideMenu(
        key: _sideMenuKey,
        menu: SideMainMenu(),
        type: SideMenuType.slide,
        child: WillPopScope(
          onWillPop: () async {
            if (_selectedIndex != 0) {
              _onItemTapped(0);
              return Future.value(false);
            }
            return Future.value(true);
          },
          child: Scaffold(
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: _widgetOptions.elementAt(_selectedIndex),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    onPressed: () {
                      final _state = _endSideMenuKey.currentState;
                      if (_state.isOpened)
                        _state.closeSideMenu();
                      else
                        _state.openSideMenu();
                    },
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Home.home_white,
                    size: 25,
                  ),
                  activeIcon: Icon(
                    Home.home_black,
                    size: 25,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Cards.card_white,
                    size: 30,
                  ),
                  activeIcon: Icon(
                    Cards.card_black,
                    size: 30,
                  ),
                  label: 'Virtual Card',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CustomIcons.rupee,
                    size: 55,
                  ),
                  activeIcon: Icon(
                    CustomIcons.rupee_dark,
                    size: 55,
                  ),
                  label: 'Pay',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Graph.graph_white,
                    size: 30,
                  ),
                  activeIcon: Icon(
                    Graph.graph_black,
                    size: 30,
                  ),
                  label: 'Analytics',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    PiggyBank.piggy_white,
                    size: 30,
                  ),
                  activeIcon: Icon(
                    PiggyBank.piggy_black,
                    size: 30,
                  ),
                  label: 'Piggy Bank',
                ),
              ],
              iconSize: 35,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              currentIndex: _selectedIndex,
              selectedIconTheme: IconThemeData(size: 35),
              selectedItemColor: Color(0xff363636),
              unselectedItemColor: Colors.blueGrey[800],
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rise/components/header_file.dart';
import 'package:rise/components/main_menu.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class RiseTagPaymentScreen extends StatefulWidget {
  @override
  _RiseTagPaymentScreenState createState() => _RiseTagPaymentScreenState();
}

class _RiseTagPaymentScreenState extends State<RiseTagPaymentScreen> {
  final font = 'ProductSans';
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var searchIcon;
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
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      HeaderContainer(
                        imageSize: Size.square(30),
                        size: Size.square(50),
                        image: 'images/payment_tab/back_button.png',
                        opacity: 1,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '₹',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                fontFamily: font,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              'risetag',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                fontFamily: font,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          primaryColor: Colors.orangeAccent,
                        ),
                        child: TextField(
                          cursorColor: Colors.orangeAccent,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.search_outlined,
                            ),
                            labelText: "Search in your contacts...",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            focusColor: Colors.orangeAccent,
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.orangeAccent),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 35,
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
        ),
      ),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeIn,
              ),
            ),
            child: child,
          ),
        );
}

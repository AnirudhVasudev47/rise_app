import 'package:flutter/material.dart';
import 'package:rise/components/main_menu.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MonthWiseTransactionsScreen extends StatefulWidget {
  @override
  _MonthWiseTransactionsScreenState createState() => _MonthWiseTransactionsScreenState();
}

class _MonthWiseTransactionsScreenState extends State<MonthWiseTransactionsScreen> {

  final font = 'ProductSans';
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _endSideMenuKey,
      inverse: false, // end side menu
      background: Color(0xffe8e8e8),
      type: SideMenuType.slide,
      menu: SideMainMenu(),
      closeIcon: Icon(Icons.close, color: Colors.black,),
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
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                  ),
                                  Container(
                                    height: 40,
                                    child: Image.asset('images/rise_black.png',),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: IconButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.arrow_back_ios_outlined, size: 30,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('this is screen'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  IconButton(
                    icon: Icon(Icons.menu, size: 35,),
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

import 'package:flutter/material.dart';
import 'package:rise/components/header_file.dart';
import 'package:rise/components/main_menu.dart';
import 'package:rise/components/phone_number_contact.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {

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
                          children: [
                            Text(
                              'Phone Number',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                fontFamily: font,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PhoneNumberContactCard(),
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

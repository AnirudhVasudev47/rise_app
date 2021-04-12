import 'package:flutter/material.dart';
import 'package:rise/components/header_file.dart';
import 'package:rise/components/main_menu.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../payment_screen.dart';

class UpiPaymentScreen extends StatefulWidget {
  @override
  _UpiPaymentScreenState createState() => _UpiPaymentScreenState();
}

class _UpiPaymentScreenState extends State<UpiPaymentScreen> {

  final font = 'ProductSans';
  TextEditingController upiIdController = new TextEditingController();
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  @override
  void initState() {
    super.initState();
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
                        padding: EdgeInsets.only(top: 40, bottom: 40),
                        child: Row(
                          children: [
                            Text(
                              'UPI ID',
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
                      Container(
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 70, top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Theme(
                                  data: Theme.of(context).copyWith(
                                    primaryColor: Colors.orangeAccent,
                                  ),
                                  child: TextField(
                                    autofocus: true,
                                    controller: upiIdController,
                                    cursorColor: Colors.orangeAccent,
                                    decoration: new InputDecoration(
                                      labelText: "Enter UPI ID",
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      focusColor: Colors.orangeAccent,
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        borderSide: BorderSide(color: Colors.orangeAccent),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 10).copyWith(top: 70),
                                  child: ElevatedButton(
                                    child: Text("Continue"),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => PaymentScreen(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      textStyle: TextStyle(
                                        fontFamily: font,
                                        fontSize: 24,
                                      ),
                                      fixedSize: Size(size.width * 0.9, 50),
                                      elevation: 5,
                                      primary: Colors.orangeAccent,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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

import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:rise/components/main_menu.dart';

class UserProfileScreen extends StatefulWidget {
  static const String id = 'user_profile_screen';
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  final font = 'ProductSans';
  bool isSwitched = false;
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 50,
                              height: 50,
                            ),
                            Container(
                              height: 30,
                              child: Image.asset('images/rise_black.png'),
                            ),
                            Container(
                                padding: EdgeInsets.only(right: 0),
                              child: IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_outlined, size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Hero(
                          tag: 'profile',
                          child: Container(
                            height: 150,
                            child: Image.asset('images/face.png'),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '₹ ',
                              style: TextStyle(
                                  fontFamily: font,
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              'gauravamar23',
                              style: TextStyle(
                                fontFamily: font,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        _profileInfo('Name', 'Gaurav Amar'),
                        _profileInfo('Account Number', '012345678954321'),
                        _profileInfo('Mobile Number', '9485293435'),
                        _profileInfo('Email', 'anirudh040799@gmail.com'),
                        _profileInfo('Address', '#177 1st Main 7th Cross Girinagar, Bangalore-85'),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25,).copyWith(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Enable Biometrics',
                                  style: TextStyle(
                                    fontFamily: font,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: Switch(
                                  activeColor: Colors.orange,
                                  value: isSwitched,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitched = value;
                                      print(isSwitched);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 25,).copyWith(top: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    'Account Details',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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

  Widget _profileInfo(String title, String value){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25,).copyWith(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: font,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            child: Flexible(
              child: Text(
                value,
                style: TextStyle(
                    fontFamily: font,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

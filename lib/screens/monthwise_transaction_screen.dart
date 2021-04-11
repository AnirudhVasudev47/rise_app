import 'package:flutter/material.dart';
import 'package:rise/components/amount_in_account.dart';
import 'package:rise/components/day_seperator.dart';
import 'package:rise/components/expandable_month_card.dart';
import 'package:rise/components/header_file.dart';
import 'package:rise/components/main_menu.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MonthWiseTransactionsScreen extends StatefulWidget {
  @override
  _MonthWiseTransactionsScreenState createState() =>
      _MonthWiseTransactionsScreenState();
}

class _MonthWiseTransactionsScreenState
    extends State<MonthWiseTransactionsScreen> {
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
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        HeaderContainer(
                          imageSize: Size.square(60),
                          size: Size.square(40),
                          image: 'images/payment_tab/back_button.png',
                          opacity: 1,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: AmountInAccount(
                            floatFontSize: 20,
                            fontSize: 40,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: ListView(
                              children: [
                                DaySeperator(
                                  dayName: ' ',
                                  seeAll: true,
                                  buttonName: 'Request Statement',
                                  onPressed: () {},
                                ),
                                ExpandableMonthCard(
                                  month: 'March 2021',
                                  monthAmount: '15,558.00',
                                  purchases: '96 purchases',
                                  moneyIn: '25,600.00',
                                  moneyOut: '25,000.00',
                                  savers: '5,600',
                                  piggy: '400.74',
                                ),
                                ExpandableMonthCard(
                                  month: 'February 2021',
                                  monthAmount: '38,000.00',
                                  color: Color(0xff53D07D),
                                  purchases: '96 purchases',
                                  moneyIn: '25,600.00',
                                  moneyOut: '25,000.00',
                                  savers: '5,600',
                                  piggy: '400.74',
                                ),
                                ExpandableMonthCard(
                                  month: 'January 2021',
                                  monthAmount: '39,000.00',
                                  purchases: '96 purchases',
                                  moneyIn: '25,600.00',
                                  moneyOut: '25,000.00',
                                  savers: '5,600',
                                  piggy: '400.74',
                                ),
                                ExpandableMonthCard(
                                  month: 'December 2020',
                                  monthAmount: '28,050.00',
                                  purchases: '96 purchases',
                                  moneyIn: '25,600.00',
                                  moneyOut: '25,000.00',
                                  savers: '5,600',
                                  piggy: '400.74',
                                ),
                                ExpandableMonthCard(
                                  month: 'November 2020',
                                  monthAmount: '38,000.00',
                                  color: Color(0xff53D07D),
                                  purchases: '96 purchases',
                                  moneyIn: '25,600.00',
                                  moneyOut: '25,000.00',
                                  savers: '5,600',
                                  piggy: '400.74',
                                ),
                                ExpandableMonthCard(
                                  month: 'October 2020',
                                  monthAmount: '38,000.00',
                                  purchases: '96 purchases',
                                  moneyIn: '25,600.00',
                                  moneyOut: '25,000.00',
                                  savers: '5,600',
                                  piggy: '400.74',
                                ),
                                ExpandableMonthCard(
                                  month: 'September 2020',
                                  monthAmount: '38,000.00',
                                  color: Color(0xff53D07D),
                                  purchases: '96 purchases',
                                  moneyIn: '25,600.00',
                                  moneyOut: '25,000.00',
                                  savers: '5,600',
                                  piggy: '400.74',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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

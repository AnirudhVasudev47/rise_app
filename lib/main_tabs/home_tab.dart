import 'package:flutter/material.dart';
import 'package:rise/components/amount_in_account.dart';
import 'package:rise/components/day_seperator.dart';
import 'package:rise/components/header_file.dart';
import 'package:rise/components/transaction_card.dart';
import 'package:rise/screens/monthwise_transaction_screen.dart';
import 'package:rise/screens/user_profile_screen.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final int milli = 50;
  ScrollController controller = ScrollController();
  bool shrinkAmount = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        shrinkAmount = controller.offset > 10;
      });
    });
  }

  final String font = 'Nunito';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          HeaderContainer(
            imageSize: Size.square(60),
            size: Size.square(60),
            image: 'images/face.png',
            opacity: 1,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserProfileScreen()),
              );
            },
          ),
          AmountInAccount(
            floatFontSize: shrinkAmount ? 15 : 15,
            fontSize: shrinkAmount ? 40 : 40,
          ),
          Expanded(
            child: ListView(
              controller: controller,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                DaySeperator(
                  dayName: 'Today',
                  seeAll: true,
                  buttonName: 'More',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MonthWiseTransactionsScreen()),
                    );
                  },
                ),
                TransactionListCard(
                  image: 'images/uber.png',
                  title: 'Uber',
                  date: '10:00am / Mar 12',
                  amount: '107.00',
                  piggyAmount: '3',
                ),
                TransactionListCard(
                  image: 'images/user_x.png',
                  title: 'Transfer from User X',
                  date: '3:20pm / Mar 12',
                  color: Color(0xff53D07D),
                  amount: '5,000.00',
                ),
                TransactionListCard(
                  image: 'images/netflix.png',
                  title: 'Netflix',
                  date: '3:20pm / Mar 12',
                  amount: '299.00',
                ),
                TransactionListCard(
                  image: 'images/user_x.png',
                  title: 'Transfer to Goa Saver',
                  date: '4:20pm / Mar 12',
                  amount: '3000.00',
                ),
                DaySeperator(
                  dayName: 'Yesterday',
                  seeAll: false,
                ),
                TransactionListCard(
                  image: 'images/amazon.png',
                  title: 'Prime',
                  date: '10:00am / Mar 11',
                  amount: '999.00',
                  piggyAmount: '1',
                ),
                TransactionListCard(
                  image: 'images/user_x.png',
                  title: 'Transfer to User Y',
                  date: '3:20pm / Mar 11',
                  color: Color(0xff53D07D),
                  amount: '3,500.00',
                ),
                TransactionListCard(
                  image: 'images/netflix.png',
                  title: 'Netflix',
                  date: '3:20pm / Mar 11',
                  amount: '299.00',
                ),
                TransactionListCard(
                  image: 'images/user_x.png',
                  title: 'Transfer to Goa Saver',
                  date: '4:20pm / Mar 11',
                  amount: '3000.00',
                ),

                TransactionListCard(
                  image: 'images/user_x.png',
                  title: 'Transfer to User Y',
                  date: '3:20pm / Mar 11',
                  color: Color(0xff53D07D),
                  amount: '3,500.00',
                ),
                TransactionListCard(
                  image: 'images/netflix.png',
                  title: 'Netflix',
                  date: '3:20pm / Mar 11',
                  amount: '299.00',
                ),
                TransactionListCard(
                  image: 'images/user_x.png',
                  title: 'Transfer to Goa Saver',
                  date: '4:20pm / Mar 11',
                  amount: '3000.00',
                ),
              ],
            ),
          ),
        ],
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

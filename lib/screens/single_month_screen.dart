import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise/components/header_file.dart';
import 'package:rise/components/transaction_card.dart';

class SingleMonthScreen extends StatefulWidget {
  final String month;
  final String monthAmount;
  final String moneyOut;
  final String moneyIn;
  final String savers;
  final String piggy;

  const SingleMonthScreen(
      {Key key,
      this.month,
      this.monthAmount,
      this.moneyOut,
      this.moneyIn,
      this.savers,
      this.piggy})
      : super(key: key);

  @override
  _SingleMonthScreenState createState() => _SingleMonthScreenState();
}

class _SingleMonthScreenState extends State<SingleMonthScreen> {
  final font = 'ProductSans';

  @override
  Widget build(BuildContext context) {
    RegExp regExp = new RegExp(r"([0-9,]*).([0-9.]*)");
    var matches = regExp.allMatches("15,558.00");
    var match = matches.elementAt(0);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  HeaderContainer(
                    imageSize: Size.square(60),
                    size: Size.square(60),
                    image: 'images/face.png',
                    opacity: 0,
                    onPressed: () {},
                  ),
                  Text(
                    widget.month,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: font,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '₹',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff53D07D),
                          fontFamily: font,
                        ),
                      ),
                      Text(
                        '${match.group(1)}',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w300,
                          fontFamily: font,
                        ),
                      ),
                      Text(
                        '.' + '${match.group(2)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          fontFamily: font,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Money out',
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: font,
                        fontWeight: FontWeight.w300),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              // SizedBox(height: image, width: image,),
                              Column(
                                children: [
                                  Text(
                                    '₹${widget.moneyIn}',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    'Money in',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '₹${widget.savers}',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff53D07D),
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    'Saved in goals',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ListView(
                        children: [
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
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                size: 35,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

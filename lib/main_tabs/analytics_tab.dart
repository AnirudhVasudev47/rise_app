import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rise/components/bar_graph_card.dart';
import 'package:rise/components/header_file.dart';
import 'dart:io' show Platform;
import 'package:rise/components/transaction_card.dart';

class AnalyticsTab extends StatefulWidget {
  @override
  _AnalyticsTabState createState() => _AnalyticsTabState();
}

class _AnalyticsTabState extends State<AnalyticsTab> {

  final String font = 'ProductSans';
  String selectedCurrency;

  @override
  void initState() {
    super.initState();
    selectedCurrency = graphList[0];
  }

  final List<String> graphList = <String>[
    'Monthly',
    'Weekly',
  ];



  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String list in graphList) {
      var newItem = DropdownMenuItem(
        child: Text(
          list,
          style: TextStyle(
            fontFamily: font,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        value: list,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;

        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String list in graphList) {
      pickerItems.add(Text(
          list,
          style: TextStyle(
          fontFamily: font,
          fontWeight: FontWeight.w400,
          fontSize: 20,
          ),
        ),
      );
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = graphList[selectedIndex];

        });
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          HeaderContainer(opacity: 0, image: 'images/face.png', size: Size.square(60), imageSize: Size.square(60),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'Spending',
                    style: TextStyle(
                      fontFamily: font,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      child: Platform.isIOS ? iOSPicker() : androidDropdown(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              child: AnalyticsBarChart(),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: size.width,
              child: ListView(
                children: [
                  SizedBox(height: 10,),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 100 ,
                      width: size.width * 0.1,
                      child: Row(
                        children: [
                          Container(padding: EdgeInsets.only(right: 10),height: 40,child: Image.asset('images/analytics_tab/lightbulb.png'),),
                          Container(
                            child: Flexible(
                              child: Text(
                                'Try spending less and saving more so you can have a stable life',
                                style: TextStyle(
                                    fontFamily: font,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: const Offset(
                              2.0,
                              2.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Expense Categories',
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            '21-27 June',
                            style: TextStyle(
                              fontFamily: font,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TransactionListCard(image: 'images/home.png', title: 'Home', date: '30% of the expense', amount: '10000.00',),
                  TransactionListCard(image: 'images/football.png', title: 'Sports', date: '15% of the expense', amount: '5000.00',),
                  TransactionListCard(image: 'images/Groceries.png', title: 'Groceries', date: '45% of the expense', amount: '3050.00',),
                  TransactionListCard(image: 'images/Groceries.png', title: 'Groceries', date: '45% of the expense', amount: '3050.00',),
                  TransactionListCard(image: 'images/Groceries.png', title: 'Groceries', date: '45% of the expense', amount: '3050.00',),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Expense Categories',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    '21-27 June',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TransactionListCard(image: 'images/home.png', title: 'Home', date: '30% of the expense', amount: '10000.00',),
          TransactionListCard(image: 'images/football.png', title: 'Sports', date: '15% of the expense', amount: '5000.00',),
          TransactionListCard(image: 'images/Groceries.png', title: 'Groceries', date: '45% of the expense', amount: '3050.00',),
 */
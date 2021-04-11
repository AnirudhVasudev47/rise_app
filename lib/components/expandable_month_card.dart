import 'package:flutter/material.dart';
import 'package:rise/screens/single_month_screen.dart';

class ExpandableMonthCard extends StatelessWidget {
  final font = 'ProductSans';
  final String month;
  final String monthAmount;
  final String moneyOut;
  final String moneyIn;
  final String savers;
  final String piggy;
  final Color color;
  final String purchases;


  const ExpandableMonthCard({Key key, this.month, this.monthAmount, this.moneyOut, this.moneyIn, this.savers, this.piggy, this.purchases, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double image = 30;
    return Container(
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.black,
        ),
        child: ExpansionTile(
          initiallyExpanded: false,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  month,
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '₹$monthAmount',
                  style: TextStyle(
                    fontFamily: font,
                    color: color,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          subtitle: Text(
            purchases,
            style: TextStyle(
              fontFamily: font,
              fontWeight: FontWeight.w300,
            ),
          ),
          childrenPadding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      // SizedBox(height: image, width: image,),
                      Column(
                        children: [
                          Text(
                            '₹$moneyOut',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Money out',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w100,
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
                      // SizedBox(height: image, width: image,),
                      Column(
                        children: [
                          Text(
                            '₹$moneyIn',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff53D07D),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Money in',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'images/monthly_piggy.png',
                        width: image,
                        height: image,
                      ),
                      Column(
                        children: [
                          Text(
                            '₹$savers',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Saved to savers',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w100,
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
                      Image.asset(
                        'images/monthly_rupee.png',
                        width: image,
                        height: image,
                      ),
                      Column(
                        children: [
                          Text(
                            '₹$piggy',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Saved in Piggybank',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(
              child: Text(
                "View All",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w200
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SingleMonthScreen(
                        moneyOut: moneyOut,
                        moneyIn: moneyIn,
                        monthAmount: monthAmount,
                        month: month,
                        savers: savers,
                        piggy: piggy,
                      )),
                );
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  fontFamily: font,
                  fontSize: 15,
                ),
                fixedSize: Size(100, 10),
                elevation: 5,
                primary: Color(0xfff3f3f3),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

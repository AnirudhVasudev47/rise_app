import 'package:flutter/material.dart';

class PiggyTabCard extends StatelessWidget {
  final String image;
  final String title;
  final Color color;
  final String amount;
  final String piggyAmount;
  final String date;

  PiggyTabCard(
      {this.image,
      this.title,
      this.color,
      this.amount,
      this.piggyAmount,
      this.date});

  final String font = 'ProductSans';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(top: 15, right: 12, left: 12, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
              child: Text(
                image,
                style: TextStyle(
                  fontSize: 30
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: font,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ' ₹$amount',
                    style: TextStyle(
                      color: color,
                      fontSize: 16,
                      fontFamily: font,
                    ),
                  ),
                  if (piggyAmount != null)
                    Text(
                      'of ₹$piggyAmount',
                      style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontFamily: font,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

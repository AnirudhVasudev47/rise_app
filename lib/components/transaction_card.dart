import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rise/components/transaction_dialog.dart';

class TransactionListCard extends StatelessWidget {

  final String image;
  final String title;
  final Color color;
  final String amount;
  final String piggyAmount;
  final String date;

  TransactionListCard({this.image, this.title, this.color, this.amount, this.piggyAmount, this.date});
  final String font = 'ProductSans';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: (){
        showModalBottomSheet(
          backgroundColor: Color(0x00000000),
          isScrollControlled: true,
            context: context,
            builder: (BuildContext context){
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(height: size.height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
                ),
                child: SingleTransactionDialog(image: image, title: title, color: color, amount: amount, piggyAmount: piggyAmount, date: date,),
            ),
          );
        });
      },
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 12, left: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Material(
              elevation: 3,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Color(0x00000000),
                  backgroundImage: AssetImage(image),
                  maxRadius: 22,
                ),
                
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: font,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: font,
                        color: Color(0xff7b7b7b),
                        fontWeight: FontWeight.w100,
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
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  if (piggyAmount != null)
                    Text(
                      'Piggy bank ₹$piggyAmount',
                      style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontFamily: font,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  if(piggyAmount == null)
                    Text(
                      ' ',
                      style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontFamily: font,
                          fontWeight: FontWeight.w300
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

/*
showDialog(context: context, builder: (BuildContext context){
          return SingleTransactionDialog(image: image, title: title, color: color, amount: amount, piggyAmount: piggyAmount, date: date,);
        });
*/
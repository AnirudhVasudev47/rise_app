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
  final bool enableDialog;

  TransactionListCard({this.image, this.title, this.color, this.amount, this.piggyAmount, this.date, this.enableDialog});
  final String font = 'Nunito';

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
        padding: EdgeInsets.only(top: 20, right: 12, left: 5, bottom: 10),
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
                  maxRadius: 20,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: font,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: font,
                        color: Color(0xffa6a6a6),
                        fontWeight: FontWeight.w300,
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
                    ' ???$amount',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: font,
                      fontWeight: FontWeight.w400,
                      color: color,
                    ),
                  ),
                  if (piggyAmount != null)
                    Text(
                      'Piggy bank ???$piggyAmount',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: font,
                        color: Color(0xffa6a6a6),
                        fontWeight: FontWeight.w300,
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
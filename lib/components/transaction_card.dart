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
          isScrollControlled: true,
            context: context,
            builder: (BuildContext context){
          return Container(height: size.height * 0.7, child: SingleTransactionDialog(image: image, title: title, color: color, amount: amount, piggyAmount: piggyAmount, date: date,));
        });
      },
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 12, left: 12, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color(0x00000000),
              backgroundImage: AssetImage(image),
              maxRadius: 22,
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
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 11,
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
                      'Piggy bank ₹$piggyAmount',
                      style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontFamily: font,
                      ),
                    ),
                  if(piggyAmount == null)
                    Text(
                      ' ',
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

/*
showDialog(context: context, builder: (BuildContext context){
          return SingleTransactionDialog(image: image, title: title, color: color, amount: amount, piggyAmount: piggyAmount, date: date,);
        });
*/
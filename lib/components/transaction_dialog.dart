import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleTransactionDialog extends StatelessWidget {
  final String image;
  final String title;
  final Color color;
  final String amount;
  final String piggyAmount;
  final String date;

  SingleTransactionDialog({this.image, this.title, this.color, this.amount, this.piggyAmount, this.date});

  final String font = 'ProductSans';

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
      child: Column(
        children: [
          Divider(
            color: Colors.black54,
            height: 20,
            thickness: 4,
            indent: size.width * 0.45,
            endIndent: size.width * 0.45,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: (){
                Navigator.pop(context);
                },
                icon: Icon(Icons.keyboard_arrow_down)
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Transaction Details',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.share_rounded, color: Colors.black54,))
            ],
          ),
          Container(
            child: RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '₹', style: TextStyle(fontSize: 24, color: Colors.black)),
                    TextSpan(
                        text: amount,
                        style: TextStyle(fontSize: 24, color: Colors.black)),
                ],
              ),
            ),
          ),
          titleDescription('Title', title),
          titleDescription('Transaction ID', '7WQE8QWD8Q8W7YQ'),
          titleDescription('Category', 'Travel'),
          titleDescription('Description', 'This is a very long description given by a customer'),
          titleDescription('Notes', 'This is a note'),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerRight,
            width: 150,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: (){},
                  minWidth: 100.0,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Get Help',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.help_outline,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleDescription(String heading, String desc){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30).copyWith(bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 5),
            child: Text(
              heading,
              style: TextStyle(
                  fontFamily: font,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Container(
            child: Flexible(
              child: Text(
                desc,
                style: TextStyle(
                    fontFamily: font,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DaySeperator extends StatelessWidget {

  final String font = 'ProductSans';
  final String dayName;
  final bool seeAll;
  final Function onPressed;

  DaySeperator({Key key, this.dayName, this.seeAll, this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            dayName,
            style: TextStyle(
              fontFamily: font,
              fontSize: 18,
              color: Colors.black54,
              fontWeight: FontWeight.w300,
            ),
          ),
          if(seeAll)
          GestureDetector(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.all(4),

              child: Row(
                children: [
                  Text(
                    'More',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.black54,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

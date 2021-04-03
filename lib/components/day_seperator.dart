import 'package:flutter/material.dart';

class DaySeperator extends StatelessWidget {
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
              fontFamily: 'Raleway',
              fontSize: 18,
            ),
          ),
          if(seeAll)
          GestureDetector(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                'More >',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

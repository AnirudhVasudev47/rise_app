import 'package:flutter/material.dart';

class DaySeperator extends StatelessWidget {
  final String font = 'Nunito';
  final String dayName;
  final bool seeAll;
  final Function onPressed;
  final String buttonName;
  DaySeperator(
      {Key key, this.dayName, this.seeAll, this.onPressed, this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            dayName,
            style: TextStyle(
              fontFamily: font,
              fontSize: 15,
              color: Color(0xff707070),
              fontWeight: FontWeight.w500,
            ),
          ),
          if (seeAll)
            GestureDetector(
              onTap: onPressed,
              child: Container(
                padding: EdgeInsets.all(4),
                child: Row(
                  children: [
                    Text(
                      buttonName,
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: 15,
                        color: Color(0xff707070),
                        fontWeight: FontWeight.w500,
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

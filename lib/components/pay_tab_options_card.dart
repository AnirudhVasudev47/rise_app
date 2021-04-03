import 'package:flutter/material.dart';

class PayTabOptionsCard extends StatelessWidget {

  final String image;
  final String title;
  final Function onPressed;
  final String font = 'ProductSans';

  const PayTabOptionsCard({Key key, this.image, this.title, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 20),
                width: 60,
                height: 30,
                child: Image.asset(image),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

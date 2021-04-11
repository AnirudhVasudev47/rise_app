import 'package:flutter/material.dart';

class AmountInAccount extends StatefulWidget {

  final double fontSize;
  final double floatFontSize;

  const AmountInAccount({Key key, this.fontSize, this.floatFontSize}) : super(key: key);

  @override
  _AmountInAccountState createState() => _AmountInAccountState();
}

class _AmountInAccountState extends State<AmountInAccount> {

  final int milli = 50;
  ScrollController controller = ScrollController();
  bool shrinkAmount = false;
  Curve _curve = Curves.easeIn;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        shrinkAmount = controller.offset > 10;
      });
    });
  }

  final String font = 'ProductSans';

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'amount',
      child: Container(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0).copyWith(top: 15),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: AnimatedDefaultTextStyle(
                    curve: _curve,
                    child: Text('Spending account'),
                    duration: Duration(milliseconds: milli),
                    style: TextStyle(
                      fontSize: widget.floatFontSize,
                      color: Colors.black45,
                      fontWeight: FontWeight.w300,
                      fontFamily: font,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                        curve: _curve,
                        child: Text('₹'),
                        duration: Duration(milliseconds: milli),
                        style: TextStyle(
                          fontSize: widget.fontSize,
                          color: Color(0xff53D07D),
                          fontFamily: font,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      AnimatedDefaultTextStyle(
                        curve: _curve,
                        child: Text('12,64,500'),
                        duration: Duration(milliseconds: milli),
                        style: TextStyle(
                          fontSize: widget.fontSize,
                          color: Colors.black,
                          fontFamily: font,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      AnimatedDefaultTextStyle(
                        curve: _curve,
                        child: Text('.00'),
                        duration: Duration(milliseconds: milli),
                        style: TextStyle(
                          fontSize: widget.floatFontSize,
                          color: Colors.black,
                          fontFamily: font,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

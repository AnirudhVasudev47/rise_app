import 'dart:math';
import 'package:flutter/material.dart';

class FlipVirtualCard extends StatefulWidget {
  @override
  _FlipVirtualCardState createState() => _FlipVirtualCardState();
}

class _FlipVirtualCardState extends State<FlipVirtualCard> {

  bool _showFrontSide;
  bool _flipXAxis;

  final String font = 'Raleway';

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
    _flipXAxis = true;
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
      child: Center(
        child: Container(
          constraints: BoxConstraints.expand(width: 350, height: 200),
          child: _buildFlipAnimation(),
        ),
      ),
    );
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget, ...list]),
        child: _showFrontSide ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront() {
    return Stack(
      key: ValueKey(true),
      children: [
        Container(
          height: 200,
          width: 350,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfffde693),
                Color(0xfff76b1c),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),
        Positioned(
          top: 45,
          left: 10,
          child: Container(
            height: 60,
            child: Image.asset('images/card_chip.png'),
          ),
        ),
        Positioned(
          top: 110,
          left: 30,
          child: Text(
            '4631 5321 8790 3251',
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: 22,
          right: 20,
          child: Container(height: 20, child: Image.asset('images/visa_logo.png'),),
        ),
        Positioned(
          top: 15,
          left: 20,
          child: Container(height: 28, child: Image.asset('images/rise_black.png'),),
        ),
        Positioned(
          top: 150,
          left: 30,
          child: Text(
            'GAURAV AMAR',
            style: TextStyle(
              fontFamily: font,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          bottom: 35,
          right: 45,
          child: Text(
            '02/77',
            style: TextStyle(
              fontFamily: font,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 95,
          child: Text(
            'VALID\nTHRU',
            style: TextStyle(
              fontFamily: font,
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRear() {
    return Stack(
      key: ValueKey(false),
      children: <Widget>[
        Container(
          height: 200,
          width: 350,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xfffde693),
                    Color(0xfff76b1c),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),
        Positioned(
          top: 37,
          child: Container(
            width: 350,
            height: 40,
            color: Colors.black,
          ),
        ),
        Positioned(
          top: 100,
          left: 10,
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: <Widget>[
              Container(
                width: 250,
                height: 30,
                color: Colors.white,
              ),
              Positioned(right: 10, child: Text('234', style: TextStyle(color: Colors.black),),)
            ],
          ),
        ),
        Positioned(
          top: 100,
          left: 10,
          child: Container(
            width: 200,
            height: 30,
            child: Image.asset('images/cvv_background.png', fit: BoxFit.fill,),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            height: 30, child: Image.asset('images/rise_black.png',),
          ),
        ),
      ],
    );
  }

  Widget __buildLayout({Key key, Widget child, String faceName, Color backgroundColor}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(faceName.substring(0, 1), style: TextStyle(fontSize: 80.0)),
      ),
    );
  }
}

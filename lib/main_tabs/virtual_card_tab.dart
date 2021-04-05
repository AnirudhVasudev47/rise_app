import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise/components/flip_virtual_card.dart';
import 'package:rise/components/header_file.dart';

class VirtualCardTab extends StatefulWidget {
  @override
  _VirtualCardTabState createState() => _VirtualCardTabState();
}

class _VirtualCardTabState extends State<VirtualCardTab> {
  final String font = 'ProductSans';
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderContainer(
            size: Size.square(60),
            imageSize: Size.square(60),
            image: 'images/face.png',
            opacity: 0,
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: FlipVirtualCard(),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Card inactive',
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Toggling this on will make your\ncard inactive',
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Switch(
                  activeColor: Colors.orange,
                  value: isSwitched,
                  onChanged: (value){
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Text(
                  'Reset Pin',
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Configuration Card',
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  child: Text(
                    'Control how your card can be used',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Report card as stolen or lost',
                        style: TextStyle(
                          fontFamily: font,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
Switch(
            value: isSwitched,
            onChanged: (value){
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
          ),
 */
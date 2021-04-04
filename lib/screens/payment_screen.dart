import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:rise/components/header_file.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  String font = 'ProductSans';
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              HeaderContainer(
                opacity: 1,
                image: 'images/payment_tab/back_button.png',
                size: Size.square(50),
                imageSize: Size.square(30),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '₹',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 26,
                              fontFamily: font,
                            ),
                          ),
                          AutoSizeTextField(
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            minWidth: 100,
                            controller: _controller,
                            fullwidth: false,
                            decoration: InputDecoration(
                              hintText: '0',
                              hintStyle: TextStyle(fontSize: 64, fontFamily: font),
                            ),
                            minFontSize: 24,
                            style: TextStyle(fontSize: 64, fontFamily: font),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

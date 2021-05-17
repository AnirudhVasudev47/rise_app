import 'dart:ui';

import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rise/components/header_file.dart';

class PaymentScreen extends StatefulWidget {
  final String name;

  const PaymentScreen({Key key, this.name}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String font = 'ProductSans';
  TextEditingController amountController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              HeaderContainer(
                opacity: 1,
                onPressed: () {
                  Navigator.pop(context);
                },
                image: 'images/payment_tab/back_button.png',
                size: Size.square(40),
                imageSize: Size.square(30),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Text(
                                    '₹',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontFamily: font,
                                    ),
                                  ),
                                ),
                                AutoSizeTextField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                      RegExp(r"[a-zA-Z\-,]+|\s"),
                                    ),
                                  ],
                                  onChanged: (text) {},
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  minWidth: 0,
                                  controller: amountController,
                                  fullwidth: false,
                                  selectionWidthStyle: BoxWidthStyle.max,
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                  cursorColor: Colors.orangeAccent,
                                  minFontSize: 10,
                                  textAlign: TextAlign.start,
                                  style:
                                      TextStyle(fontSize: 64, fontFamily: font),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Color(0xffdcdcdc),
                                    ),
                                    child: AutoSizeTextField(
                                      onChanged: (desc) {},
                                      autofocus: false,
                                      keyboardType: TextInputType.text,
                                      controller: descController,
                                      wrapWords: false,
                                      fullwidth: true,
                                      maxLines: 3,
                                      minLines: 1,
                                      cursorColor: Colors.orangeAccent,
                                      selectionWidthStyle: BoxWidthStyle.max,
                                      decoration: InputDecoration(
                                        hintText: 'Your descreption',
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                      ),
                                      minFontSize: 15,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: font,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 50,
                              child: CircleAvatar(
                                backgroundColor: Color(0xffd0cdcd),
                                child: Image.asset(
                                  'images/face.png', //here comes the beneficiary Image
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Sending to ',
                                    style: TextStyle(
                                        fontFamily: font,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    widget.name == null ? 'Ajay' : '₹'+widget.name, //here comes the beneficiary name
                                    style: TextStyle(
                                        fontFamily: font,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        child: Text("Pay"),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontFamily: font,
                            fontSize: 24,
                          ),
                          fixedSize: Size(size.width * 0.8, 50),
                          elevation: 5,
                          primary: Colors.orangeAccent,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
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

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
    descController.dispose();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise/components/header_file.dart';
import 'package:rise/screens/payment_screen.dart';

class BankPaymentScreen extends StatefulWidget {
  @override
  _BankPaymentScreenState createState() => _BankPaymentScreenState();
}

class _BankPaymentScreenState extends State<BankPaymentScreen> {
  TextEditingController accountController = new TextEditingController();
  TextEditingController accCheckController = new TextEditingController();
  TextEditingController ifscController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  final String font = 'ProductSans';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                HeaderContainer(
                  imageSize: Size.square(30),
                  size: Size.square(50),
                  image: 'images/payment_tab/back_button.png',
                  opacity: 1,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                  width: size.width,
                  child: Text(
                    'Bank Transfer',
                    style: TextStyle(
                      fontFamily: font,
                      fontWeight: FontWeight.w300,
                      fontSize: 34,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Material(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.orangeAccent,
                            ),
                            child: TextField(
                              controller: accountController,
                              cursorColor: Colors.orangeAccent,
                              decoration: new InputDecoration(
                                labelText: "Account number",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                focusColor: Colors.orangeAccent,
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.orangeAccent),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Material(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.orangeAccent,
                            ),
                            child: TextField(
                              controller: accCheckController,
                              cursorColor: Colors.orangeAccent,
                              decoration: new InputDecoration(
                                labelText: "Re-enter account Number",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                focusColor: Colors.orangeAccent,
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.orangeAccent),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Material(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.orangeAccent,
                            ),
                            child: TextField(
                              controller: ifscController,
                              cursorColor: Colors.orangeAccent,
                              decoration: new InputDecoration(
                                labelText: "IFSC number",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                focusColor: Colors.orangeAccent,
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.orangeAccent),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Material(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.orangeAccent,
                            ),
                            child: TextField(
                              controller: nameController,
                              cursorColor: Colors.orangeAccent,
                              decoration: new InputDecoration(
                                labelText: "Name",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                focusColor: Colors.orangeAccent,
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.orangeAccent),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10).copyWith(top: 70),
                  child: ElevatedButton(
                    child: Text("Continue"),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                            name: nameController.text.toString(),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontFamily: font,
                        fontSize: 24,
                      ),
                      fixedSize: Size(size.width * 0.9, 50),
                      elevation: 5,
                      primary: Colors.orangeAccent,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
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

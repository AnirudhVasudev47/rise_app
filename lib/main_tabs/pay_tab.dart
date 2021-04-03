import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:rise/components/header_file.dart';
import 'package:rise/components/pay_tab_options_card.dart';
import 'package:rise/screens/risetag_payment_screen.dart';

class PaymentTab extends StatefulWidget {
  @override
  _PaymentTabState createState() => _PaymentTabState();
}

class _PaymentTabState extends State<PaymentTab> {

  final int milli = 80;
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
  String qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          HeaderContainer(
            onPressed: () async{
              String codeScanner = await BarcodeScanner.scan();    //barcode scanner
              setState(() {
                qrCodeResult = codeScanner;
                print(qrCodeResult); // Check and act accordingly
              });
            },
            size: Size.square(50),
            imageSize: Size.square(10),
            image: 'images/payment_tab/qrCode.png',
            opacity: 1,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 15),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    child: AnimatedDefaultTextStyle(
                      curve: _curve,
                      child: Text('Spending account'),
                      duration: Duration(milliseconds: milli),
                      style: TextStyle(
                        fontSize: shrinkAmount?8:16,
                        color: Colors.black45,
                        fontWeight: FontWeight.w700,
                        fontFamily: font,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedDefaultTextStyle(
                          curve: _curve,
                          child: Text('₹12,64,500'),
                          duration: Duration(milliseconds: milli),
                          style: TextStyle(
                            fontSize: shrinkAmount?20:40,
                            color: Colors.black,
                            fontFamily: font,
                          ),
                        ),
                        AnimatedDefaultTextStyle(
                          curve: _curve,
                          child: Text('.00'),
                          duration: Duration(milliseconds: milli),
                          style: TextStyle(
                            fontSize: shrinkAmount?10:20,
                            color: Colors.black,
                            fontFamily: font,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: PayTabOptionsCard(
                      image: 'images/payment_tab/rise_tag.png',
                      title: '₹Risetag',
                      onPressed: (){
                        Navigator.push(
                          context,
                          ScaleRoute(page: RiseTagPaymentScreen()),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: PayTabOptionsCard(
                      image: 'images/payment_tab/bank_transfer.png',
                      title: 'Bank Transfer',
                      onPressed: (){
                        print('Bank Transfer');
                      },
                    ),
                  ),
                  Container(
                    child: PayTabOptionsCard(
                      image: 'images/payment_tab/phone_number.png',
                      title: 'Phone Number',
                      onPressed: (){
                        print('Phone Number');
                      },
                    ),
                  ),
                  Container(
                    child: PayTabOptionsCard(
                      image: 'images/payment_tab/upi.png',
                      title: 'UPI ID',
                      onPressed: (){
                        print('UPI ID');
                      },
                    ),
                  ),
                  Container(
                    child: PayTabOptionsCard(
                      image: 'images/payment_tab/bill.png',
                      title: 'Bill Payment',
                      onPressed: (){
                        print('Bill Payment');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise/components/header_file.dart';
import 'package:rise/components/piggy_dialog_box.dart';
import 'package:rise/components/piggy_tab_card.dart';

class PiggyBankTab extends StatefulWidget {
  @override
  _PiggyBankTabState createState() => _PiggyBankTabState();
}

class _PiggyBankTabState extends State<PiggyBankTab> {

  TextEditingController nameController = TextEditingController();
  ScrollController controller = ScrollController();
  bool shrinkAmount = false;
  double heightSize = 20;
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
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          HeaderContainer(opacity: 0, image: 'images/face.png', size: Size.square(60), imageSize: Size.square(60),),
          Container(
            child: AnimatedDefaultTextStyle(
              child: Text('₹12,64,500.00'),
              duration: Duration(milliseconds: 400),
              style: TextStyle(
                fontSize: shrinkAmount?20:40,
                color: Colors.black,
                fontFamily: font,
              ),
            ),
          ),
          Container(
            child: AnimatedDefaultTextStyle(
              child: Text('Spending account'),
              duration: Duration(milliseconds: 400),
              style: TextStyle(
                fontSize: shrinkAmount?8:16,
                color: Colors.black45,
                fontWeight: FontWeight.w700,
                fontFamily: font,
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: ListView(
                controller: controller,
                children: <Widget>[
                  SizedBox(height: heightSize,),
                  PiggyTabCard(image: 'images/piggy_tab/lifestyle.png', title: 'Life Savings', amount: '1,00,000.00', ),
                  SizedBox(height: heightSize,),
                  PiggyTabCard(image: 'images/piggy_tab/rent.png', title: 'Rent', amount: '5,000.00', piggyAmount: '15,000',),
                  SizedBox(height: heightSize,),
                  PiggyTabCard(image: 'images/piggy_tab/birthday.png', title: 'Birthday', amount: '3,050.00', piggyAmount: '5,000',),
                  SizedBox(height: heightSize,),
                  PiggyTabCard(image: 'images/piggy_tab/laptop.png', title: 'Laptop', amount: '29,009.00', ),
                  SizedBox(height: heightSize,),
                  PiggyTabCard(image: 'images/piggy_tab/emergency.png', title: 'Emergency Fund', amount: '3,000.00', ),
                  SizedBox(height: heightSize,),
                  PiggyTabCard(image: 'images/piggy_bank_color.png', title: 'Piggy Bank', amount: '1,000.00', ),
                  GestureDetector(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PiggyDialogBox();
                          });
                    },
                    child: Container(
                      height: 60,
                      child: Image.asset('images/piggy_tab/plus.png'),
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

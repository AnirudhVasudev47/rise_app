import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise/components/amount_in_account.dart';
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
    return Container(
      child: Column(
        children: <Widget>[
          HeaderContainer(
            opacity: 0,
            image: 'images/face.png',
            size: Size.square(60),
            imageSize: Size.square(60),
          ),
          AmountInAccount(
            floatFontSize: shrinkAmount ? 10 : 20,
            fontSize: shrinkAmount ? 20 : 40,
          ),
          Container(
            child: Expanded(
              child: ListView(
                controller: controller,
                children: <Widget>[
                  SizedBox(
                    height: heightSize,
                  ),
                  PiggyTabCard(
                    image: '💰',
                    title: 'Life Savings',
                    amount: '1,00,000.00',
                  ),
                  SizedBox(
                    height: heightSize,
                  ),
                  PiggyTabCard(
                    image: '🏘️',
                    title: 'Rent',
                    amount: '5,000.00',
                    piggyAmount: '15,000',
                  ),
                  SizedBox(
                    height: heightSize,
                  ),
                  PiggyTabCard(
                    image: '🎂',
                    title: 'Birthday',
                    amount: '3,050.00',
                    piggyAmount: '5,000',
                  ),
                  SizedBox(
                    height: heightSize,
                  ),
                  PiggyTabCard(
                    image: '💻',
                    title: 'Laptop',
                    amount: '29,009.00',
                  ),
                  SizedBox(
                    height: heightSize,
                  ),
                  PiggyTabCard(
                    image: '🆘',
                    title: 'Emergency Fund',
                    amount: '3,000.00',
                  ),
                  SizedBox(
                    height: heightSize,
                  ),
                  PiggyTabCard(
                    image: '🐷',
                    title: 'Piggy Bank',
                    amount: '1,000.00',
                  ),
                  GestureDetector(
                    onTap: () {
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

import 'package:flutter/material.dart';

class PiggyDialogBox extends StatefulWidget {
  @override
  _PiggyDialogBoxState createState() => _PiggyDialogBoxState();
}

class _PiggyDialogBoxState extends State<PiggyDialogBox> {
  TextEditingController nameController = TextEditingController();

  final String font = 'ProductSans';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20.0)), //this right here
      child: Container(
        padding: EdgeInsets.all(10),
        height: size.height * 0.5,
        width: size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'What would you like to name your goal?',
              style: TextStyle(
                fontFamily: font,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Goal Name',
                hintText: 'Eg: iPhone 12 Pro Max',
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PiggyTab2();
                    });
              },
              child: Container(
                padding: EdgeInsets.all(10).copyWith(left: 40, right: 40),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PiggyTab2 extends StatefulWidget {
  @override
  _PiggyTab2State createState() => _PiggyTab2State();
}

class _PiggyTab2State extends State<PiggyTab2> {

  TextEditingController nameController = TextEditingController();
  final String font = 'ProductSans';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20.0)), //this right here
      child: Container(
        padding: EdgeInsets.all(10),
        height: size.height * 0.7,
        width: size.width * 0.99,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Choose an Emoji for your goal',
              style: TextStyle(
                fontFamily: font,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
                crossAxisCount: 3,
                children: <Widget>[
                  Image.asset('images/piggy_tab/piggy_dialog/ball.png'),
                  Image.asset('images/piggy_tab/piggy_dialog/cake.png'),
                  Image.asset('images/piggy_tab/piggy_dialog/cart.png'),
                  Image.asset('images/piggy_tab/piggy_dialog/house.png'),
                  Image.asset('images/piggy_tab/piggy_dialog/japanese_box.png'),
                  Image.asset('images/piggy_tab/piggy_dialog/money.png'),
                  Image.asset('images/piggy_tab/piggy_dialog/popcorn.png'),
                  Image.asset('images/piggy_tab/piggy_dialog/tomato.png'),
                  Image.asset('images/piggy_tab/piggy_dialog/car.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


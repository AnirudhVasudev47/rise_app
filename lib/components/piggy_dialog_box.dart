import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          borderRadius: BorderRadius.circular(20.0)), //this right here
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
              onChanged: (text) {
                print(text);
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Goal Name',
                hintText: 'Eg: iPhone 12 Pro Max',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (nameController.text.isNotEmpty) {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PiggyTab2();
                      });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10).copyWith(left: 40, right: 40),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
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
  TextEditingController emojiController = TextEditingController();
  final String font = 'ProductSans';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
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
            TextField(
              controller: emojiController,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(r"[a-zA-Z0-9\-,]+|\s"),
                ),
              ],
              onChanged: (text) {
                print(text);
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Emoji for goal',
                hintText: 'Eg: 💰',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (emojiController.text.isNotEmpty) {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PiggyTab3();
                      });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10).copyWith(left: 40, right: 40),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
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

class PiggyTab3 extends StatefulWidget {
  @override
  _PiggyTab3State createState() => _PiggyTab3State();
}

class _PiggyTab3State extends State<PiggyTab3> {
  TextEditingController emojiController = TextEditingController();
  final String font = 'ProductSans';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        padding: EdgeInsets.all(10),
        height: size.height * 0.7,
        width: size.width * 0.99,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Enter the amount you want to save',
              style: TextStyle(
                fontFamily: font,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            TextField(
              controller: emojiController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(r"[a-zA-Z\-,]+|\s"),
                ),
              ],
              onChanged: (text) {
                print(text);
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter amount',
                hintText: 'Eg: 12,000',
              ),
            ),
            GestureDetector(
              onTap: () {
                if (emojiController.text.isNotEmpty) {
                  Navigator.pop(context);

                }
              },
              child: Container(
                padding: EdgeInsets.all(10).copyWith(left: 40, right: 40),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  'Done',
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

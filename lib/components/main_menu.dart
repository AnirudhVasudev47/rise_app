import 'package:flutter/material.dart';

class SideMainMenu extends StatelessWidget {
  final font = 'Raleway';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 10,),
                      child: Icon(Icons.info_outline),
                    ),
                    Container(
                      child: Text(
                        'About us',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: font,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 10,),
                      child: Icon(Icons.help_outline),
                    ),
                    Container(
                      child: Text(
                        'FAQ\'s',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: font,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 10,),
                      child: Icon(Icons.file_copy_outlined),
                    ),
                    Container(
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: font,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 10,),
                      child: Icon(Icons.supervisor_account_rounded),
                    ),
                    Container(
                      child: Text(
                        'Invite friends',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: font,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 10,),
                      child: Icon(Icons.question_answer_outlined),
                    ),
                    Container(
                      child: Text(
                        'Help Center',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: font,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Version 1.0.0',
                        style: TextStyle(
                          fontFamily: font,
                        ),
                      ),
                      Container(
                        height: 30,
                        child: Image.asset('images/rise_black.png'),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 5,),
                        child: Icon(Icons.logout),
                      ),
                      Container(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: font,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}

// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import 'WeatherEromTown.dart';

class regPage extends StatefulWidget {
  @override
  _regPageState createState() => _regPageState();
}

class _regPageState extends State<regPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xff6657A1),
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 135),
                  child: Text(
                    'Авторизация',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(
                  flex: 7,
                ),
                Container(
                  padding: EdgeInsets.only(left: 29, right: 29),
                  child: TextField(
                    style: TextStyle(fontSize: 16, color: Color(0xffF2F2F2)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                      hintText: "Логин",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xffF2F2F2)),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.only(left: 29, right: 29),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(fontSize: 16, color: Color(0xffF2F2F2)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                      hintText: "Пароль",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xffF2F2F2)),
                    ),
                  ),
                ),
                Spacer(
                  flex: 7,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 40),
                  child: ButtonTheme(
                    height: 65,
                    minWidth: 262,
                    child: RaisedButton(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Color(0xff333333),
                      child: Text(
                        "Войти",
                        style: TextStyle(color: Colors.white, fontSize: 21),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CountOfTownWeather(),
                            ),
                          );
                        });
                      },
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

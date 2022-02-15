// ignore_for_file: file_names, deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Kaliningrad.dart';
import 'Kazan.dart';
import 'Moscow.dart';
import 'Piter.dart';
import 'Sochi.dart';

class CountOfTownWeather extends StatefulWidget {
  @override
  _CountOfTownWeatherState createState() => _CountOfTownWeatherState();
}

class _CountOfTownWeatherState extends State<CountOfTownWeather> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 17,
                    top: 21,
                  ),
                  child: TextButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app_rounded,
                          color: Colors.black,
                        ),
                        Text(
                          'Выйти',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(13),
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    child: FirstMoscow(context),
                    padding: EdgeInsets.only(bottom: 16, top: 16),
                  ),
                  Container(
                    child: SecondPiter(context),
                    padding: EdgeInsets.only(bottom: 16),
                  ),
                  Container(
                    child: ThirdKaliningrad(context),
                    padding: EdgeInsets.only(bottom: 16),
                  ),
                  Container(
                    child: FourKazan(context),
                    padding: EdgeInsets.only(bottom: 16),
                  ),
                  Container(
                    child: FiveSochi(context),
                    padding: EdgeInsets.only(bottom: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget FirstMoscow(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => MoscowPage()));
    },
    child: Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blue,
        elevation: 10,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                '1',
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              child: Image.asset(
                'images/Line.png',
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Москва',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: (size.width < 390) ? 22 : 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 230,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Очаровательный город, имеющий огромное количество достопримечательностей и интересных мест. Сюда ведут многие пути и человеческие судьбы. Москва — блистательный город, достойный называться столицей.',
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: (size.width < 390) ? 10 : 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 5),
            Container(
              child: Image.asset(
                'images/Moscow.png',
                height: (size.width < 390) ? 0 : 60,
                width: (size.width < 390) ? 0 : 60,
                color: Colors.white,
              ),
            ),
            Spacer()
          ],
        ),
      ),
    ),
  );
}

Widget SecondPiter(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => PiterPage()));
    },
    child: Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blue,
        elevation: 10,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 21, right: 15),
              child: Text(
                '2',
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              child: Image.asset(
                'images/Line.png',
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Санкт - Петербург',
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: (size.width < 390) ? 22 : 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 230,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Oдин из самых потрясающих городов Европы Это город удивительной архитектуры,романтики и вдохновения, разводных мостов и белых ночей.',
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.white,
                        fontSize: (size.width < 390) ? 10 : 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 5),
            Container(
              child: Image.asset(
                'images/Piter.png',
                height: (size.width < 390) ? 0 : 60,
                width: (size.width < 390) ? 0 : 60,
                color: Colors.white,
              ),
            ),
            Spacer()
          ],
        ),
      ),
    ),
  );
}

Widget ThirdKaliningrad(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => KaliningradPage()));
    },
    child: Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blue,
        elevation: 10,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 21, right: 15),
              child: Text(
                '3',
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              child: Image.asset(
                'images/Line.png',
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Калининград',
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: (size.width < 390) ? 22 : 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 230,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Настоящий кусочек Европы, принадлежащий России. С одной стороны – немецкие кирхи, бастионы и башни. С другой – русский язык, рубли в качестве валюты и лица соотечественников, слегка уступающие в приветливостивропейским.',
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.white,
                        fontSize: (size.width < 390) ? 10 : 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 5),
            Container(
              child: Image.asset(
                'images/Kaliningrad.png',
                height: (size.width < 390) ? 0 : 60,
                width: (size.width < 390) ? 0 : 60,
                color: Colors.white,
              ),
            ),
            Spacer()
          ],
        ),
      ),
    ),
  );
}

Widget FourKazan(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => KazanPage()));
    },
    child: Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blue,
        elevation: 10,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 21, right: 15),
              child: Text(
                '4',
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              child: Image.asset(
                'images/Line.png',
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Казань',
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: (size.width < 390) ? 22 : 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 230,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Сказочно красивый город, который славится множеством значимыхдостопримечательностей и архитектурных памятников. Здесь смешаны воедино национальные традиции загадочного Востока и современного Запада.',
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.white,
                        fontSize: (size.width < 390) ? 10 : 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 5),
            Container(
              child: Image.asset(
                'images/Kazan.png',
                height: (size.width < 390) ? 0 : 60,
                width: (size.width < 390) ? 0 : 60,
                color: Colors.white,
              ),
            ),
            Spacer()
          ],
        ),
      ),
    ),
  );
}

Widget FiveSochi(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => SochiPage()));
    },
    child: Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blue,
        elevation: 10,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 21, right: 15),
              child: Text(
                '5',
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              child: Image.asset(
                'images/Line.png',
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Сочи',
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: (size.width < 390) ? 22 : 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 230,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Летняя, морская, горнолыжная столица России и главный курорт страны. Черноморская здравница манит туристов отличными пляжами субтропической природой, стабильно солнечной погодой и крутизной горных пиков.',
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.white,
                        fontSize: (size.width < 390) ? 10 : 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 5),
            Container(
              child: Image.asset(
                'images/Sochi.png',
                height: (size.width < 390) ? 0 : 60,
                width: (size.width < 390) ? 0 : 60,
                color: Colors.white,
              ),
            ),
            Spacer()
          ],
        ),
      ),
    ),
  );
}

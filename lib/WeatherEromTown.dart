// ignore_for_file: file_names, deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';

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
                padding: EdgeInsets.fromLTRB(13, 30, 13, 0),
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    child: FirstMoscow(),
                    padding: EdgeInsets.only(bottom: 16),
                  ),
                  Container(
                    child: SecondPiter(),
                    padding: EdgeInsets.only(bottom: 16),
                  ),
                  Container(
                    child: ThirdKaliningrad(),
                    padding: EdgeInsets.only(bottom: 16),
                  ),
                  Container(
                    child: FourKazan(),
                    padding: EdgeInsets.only(bottom: 16),
                  ),
                  Container(
                    child: FiveSochi(),
                    padding: EdgeInsets.only(bottom: 16),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget FirstMoscow() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.only(),
      height: 130,
      width: 395,
      decoration: BoxDecoration(
        color: Color(0xff6657A1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 21, right: 15),
            child: Text(
              '#1',
              style: TextStyle(
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
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Москва',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Очаровательный город, имеющий огромное\nколичество достопримечательностей и интересных мест. \nСюда ведут многие пути и человеческие судьбы.\nМосква — блистательный город,\nдостойный называться столицей.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(
              right: 15,
            ),
            child: Image.asset(
              'images/Moscow.png',
              height: 65,
              width: 65,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget SecondPiter() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 130,
      width: 395,
      decoration: BoxDecoration(
        color: Color(0xff6657A1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 21, right: 15),
            child: Text(
              '#2',
              style: TextStyle(
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
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        'Санкт - Петербург',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Oдин из самых потрясающих городов Европы\nЭто город удивительной архитектуры,\nромантики и вдохновения,\nразводных мостов и белых ночей.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(right: 21),
            child: Image.asset(
              'images/Piter.png',
              height: 70,
              width: 70,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget ThirdKaliningrad() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.only(),
      height: 130,
      width: 395,
      decoration: BoxDecoration(
        color: Color(0xff6657A1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 21, right: 15),
            child: Text(
              '#3',
              style: TextStyle(
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
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Калининград',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Настоящий кусочек Европы, принадлежащий России.\nС одной стороны – немецкие кирхи, бастионы и башни. \nС другой – русский язык, рубли в качестве валюты и\nлица соотечественников, слегка уступающие в \nприветливостивропейским.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(right: 21),
            child: Image.asset(
              'images/Kaliningrad.png',
              height: 70,
              width: 70,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget FourKazan() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.only(),
      height: 130,
      width: 395,
      decoration: BoxDecoration(
        color: Color(0xff6657A1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 21, right: 15),
            child: Text(
              '#4',
              style: TextStyle(
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
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Казань',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Сказочно красивый город, который славится\nмножеством значимыхдостопримечательностей\nи архитектурных памятников.\nЗдесь смешаны воедино национальные традиции\nзагадочного Востока и современного Запада.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(
              right: 21,
            ),
            child: Image.asset(
              'images/Kazan.png',
              height: 70,
              width: 70,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget FiveSochi() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.only(),
      height: 130,
      width: 395,
      decoration: BoxDecoration(
        color: Color(0xff6657A1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 21, right: 15),
            child: Text(
              '#5',
              style: TextStyle(
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
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Сочи',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Летняя, морская, горнолыжная столица России и\nглавный курорт страны. Черноморская здравница\nманит туристов отличными пляжами \nсубтропической природой, стабильно солнечной\nпогодой и крутизной горных пиков.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(
              right: 21,
            ),
            child: Image.asset(
              'images/Sochi.png',
              height: 70,
              width: 70,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

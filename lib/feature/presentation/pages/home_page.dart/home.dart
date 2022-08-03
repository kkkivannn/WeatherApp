import 'dart:io';

import 'package:flutter/material.dart';

import '../../widgets/card_kaliningrad.dart';
import '../../widgets/card_kazan.dart';
import '../../widgets/card_moscow.dart';
import '../../widgets/card_saint_peterburg.dart';
import '../../widgets/card_sochi.dart';

class CountOfTownWeather extends StatefulWidget {
  const CountOfTownWeather({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.only(
                    left: 17,
                    top: 21,
                  ),
                  child: TextButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Row(
                      children: const [
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
                padding: const EdgeInsets.all(13),
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    child: const FirstMoscow(),
                    padding: const EdgeInsets.only(bottom: 16, top: 16),
                  ),
                  Container(
                    child: const SecondSaintPeterburg(),
                    padding: const EdgeInsets.only(bottom: 16),
                  ),
                  Container(
                    child: const ThirdKaliningrad(),
                    padding: const EdgeInsets.only(bottom: 16),
                  ),
                  Container(
                    child: const FourKazan(),
                    padding: const EdgeInsets.only(bottom: 16),
                  ),
                  Container(
                    child: const FiveSochi(),
                    padding: const EdgeInsets.only(bottom: 16),
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

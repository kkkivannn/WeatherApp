// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../core/utils/save_tokens.dart';
import '../kaliningrad/widget/card_kaliningrad.dart';
import '../kazan/widget/card_kazan.dart';
import '../moscow/widget/card_moscow.dart';
import '../saint_petersburg/widget/card_saint_peterburg.dart';
import '../sochi/widget/card_sochi.dart';

class CountOfTownWeather extends StatefulWidget {
  const CountOfTownWeather({Key? key}) : super(key: key);

  @override
  _CountOfTownWeatherState createState() => _CountOfTownWeatherState();
}

class _CountOfTownWeatherState extends State<CountOfTownWeather> {
  final SignInUtilsRepository signInUtilsRepository = SignInUtilsRepository();
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
                    onPressed: () async {
                      await signInUtilsRepository.logOut();
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

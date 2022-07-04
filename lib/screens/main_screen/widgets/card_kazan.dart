import 'package:flutter/material.dart';

import '../../kazan/kazan.dart';

class FourKazan extends StatelessWidget {
  const FourKazan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const KazanPage()));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blue,
        elevation: 10,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 21, right: 15),
              child: const Text(
                '4',
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Image.asset(
              'images/Line.png',
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20),
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
                    padding: const EdgeInsets.only(bottom: 20),
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
            const Spacer(flex: 5),
            Image.asset(
              'images/Kazan.png',
              height: (size.width < 390) ? 0 : 60,
              width: (size.width < 390) ? 0 : 60,
              color: Colors.white,
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

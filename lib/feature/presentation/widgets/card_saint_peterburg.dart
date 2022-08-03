import 'package:flutter/material.dart';

import '../../saint_petersburg/saint_peterburg.dart';

class SecondSaintPeterburg extends StatelessWidget {
  const SecondSaintPeterburg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PiterPage()));
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
                '2',
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
                    padding: const EdgeInsets.only(bottom: 20),
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
            const Spacer(flex: 5),
            Image.asset(
              'images/Piter.png',
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

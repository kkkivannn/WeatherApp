// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../page/moscow.dart';

class FirstMoscow extends StatelessWidget {
  const FirstMoscow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MoscowPage()));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blue,
        elevation: 10,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: const Text(
                '1',
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
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20),
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
                    padding: const EdgeInsets.only(bottom: 20),
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
            const Spacer(flex: 5),
            Image.asset(
              'images/Moscow.png',
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

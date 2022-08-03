import 'package:flutter/material.dart';
import '../home_page.dart/home.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.blue,
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 135),
                  child: const Text(
                    'Авторизация',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 7,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 29, right: 29),
                  child: TextField(
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xffF2F2F2)),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                      hintText: "Логин",
                      hintStyle: const TextStyle(
                          fontSize: 16, color: Color(0xffF2F2F2)),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(left: 29, right: 29),
                  child: TextField(
                    obscureText: true,
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xffF2F2F2)),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                      hintText: "Пароль",
                      hintStyle: const TextStyle(
                          fontSize: 16, color: Color(0xffF2F2F2)),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 7,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff333333)),
                      minimumSize:
                          MaterialStateProperty.all(const Size(262, 65)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CountOfTownWeather(),
                        ),
                      );
                    },
                    child: const Text(
                      'Вход',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
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

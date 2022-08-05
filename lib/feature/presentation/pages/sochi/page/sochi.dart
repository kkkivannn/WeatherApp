import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/theme/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/weather_sochi_cubit.dart';

class SochiPage extends StatefulWidget {
  const SochiPage({Key? key}) : super(key: key);

  @override
  _SochiPageState createState() => _SochiPageState();
}

class _SochiPageState extends State<SochiPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WeatherSochiCubit, WeatherSochiState>(
      builder: (context, state) {
        if (state is WeatherSochiEmpty) {
          context.read<WeatherSochiCubit>().fetchWeather("Kaliningrad");
        } else if (state is WeatherSochiError) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.blue,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Text('Что-то пошло не так!')],
                ),
              ),
            ),
          );
        } else if (state is WeatherSochiLoaded) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.blue,
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 35),
                        child: Text(
                          state.weather.nameTown,
                          style: const TextStyle(
                            fontSize: 30,
                            fontFamily: "OpenSans",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "${state.weather.temperature.toStringAsFixed(0)}\u00B0",
                        style: const TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 90,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 30,
                        ),
                        child: Text(
                          state.weather.description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "OpenSans",
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                            ),
                          ),
                          width: size.width,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            padding:
                                                const EdgeInsets.only(top: 40),
                                            child: const Text(
                                              'Ощущается как:',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontFamily: "OpenSans",
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(top: 40),
                                            child: Text(
                                              state.weather.feelsLike
                                                  .toStringAsFixed(1),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontFamily: "OpenSans",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            padding:
                                                const EdgeInsets.only(top: 40),
                                            child: const Text(
                                              'Скорость ветра:',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontFamily: "OpenSans",
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(top: 40),
                                            child: Text(
                                              '${state.weather.speedWind.toStringAsFixed(1)} м/c',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontFamily: "OpenSans",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          TextButton(
                                            onPressed: () async {
                                              const _url =
                                                  'https://www.google.com/search?q=%D0%A4%D0%BE%D1%82%D0%BE+%D0%A1%D0%BE%D1%87%D0%B8+4%D0%BA&tbm=isch&ved=2ahUKEwiYsOGx0IL2AhUOCHcKHZCfCw0Q2-cCegQIABAA&oq=%D0%A4%D0%BE%D1%82%D0%BE+%D0%A1%D0%BE%D1%87%D0%B8+4%D0%BA&gs_lcp=CgNpbWcQAzIHCCMQ7wMQJzoFCAAQgAQ6BggAEAcQHjoICAAQCBAHEB5Q_AxYzxpgpyBoAHAAeACAAUiIAe4CkgEBNpgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=zRcMYtiVMo6Q3AOQv65o&bih=961&biw=1920';
                                              if (await canLaunch(_url)) {
                                                await launch(_url);
                                              }
                                            },
                                            child: const Text(
                                              'Ссылка на фото города:',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontFamily: "OpenSans",
                                                fontSize: 25,
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            'images/So.png',
                                            height:
                                                (size.height > 696) ? 150 : 0,
                                            width: (size.width > 454) ? 150 : 0,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 25),
                                      child: CustomButton(),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff47B5FF),
                  Color(0xff1363DF),
                ],
              ),
            ),
            child: const Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

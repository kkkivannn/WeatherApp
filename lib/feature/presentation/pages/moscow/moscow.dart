import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/presentation/cubit/weather_cubit.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../theme/widgets/custom_button.dart';

class MoscowPage extends StatelessWidget {
  const MoscowPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherEmpty) {
          context.read<WeatherCubit>().fetchWeather("Moscow");
        } else if (state is WeatherError) {
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
        } else if (state is WeatherLoaded) {
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
                          state.weather.description,
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
                                                  'https://www.google.com/search?q=%D0%A4%D0%BE%D1%82%D0%BE+%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D1%8B+4%D0%BA&sxsrf=APq-WBvToMb60sCgJpFu667MkC1IzRx5lA:1644954785350&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiFxZuNvoL2AhVBmIsKHYuSDOIQ_AUoAXoECAEQAw&biw=1920&bih=961&dpr=1#imgrc=eB7mbfXxndH3UM';
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
                                            'images/msc.png',
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

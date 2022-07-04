import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/widgets/custom_button.dart';
import 'bloc/weather_sochi_screen_cubit.dart';
import 'bloc/weather_sochi_screen_state.dart';

class SochiPage extends StatefulWidget {
  const SochiPage({Key? key}) : super(key: key);

  @override
  _SochiPageState createState() => _SochiPageState();
}

class _SochiPageState extends State<SochiPage> {
  // var _temp;
  // var _name;
  // var _id;
  // var _weather;
  // var _weatherDes;
  // var _feelsLike;
  // var _TownName;
  // var _textWeather;
  // var _wind;

  // Future<void> getWeather() async {
  //   String city = "sochi";
  //   String apiKey = "4f835643d7ff653f90b1686997a64d12";
  //   var url =
  //       "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey";
  //   var response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     final result = jsonDecode(response.body);
  //     setState(() {
  //       _name = result['name'];
  //       _temp = result['main']["temp"];
  //       _weather = result['weather'][0]["main"];
  //       _feelsLike = result['main']["feels_like"];
  //       _weatherDes = result['weather'][0]['description"'];
  //       _wind = result['wind']['speed'];
  //     });
  //   }
  // }

  // Widget Weathericon(BuildContext context, var weather) {
  //   late Image ImageWeather;
  //   if (weather == "Clouds") {
  //     _textWeather = "Облачно";
  //     ImageWeather = Image.asset('icons/PartlyCloudy-Bold.png');
  //   } else if (weather == "Clear") {
  //     _textWeather = "Ясно";
  //     ImageWeather = Image.asset('icons/PartlyCloudy-Bulk.png');
  //   } else if (weather == 'Snow') {
  //     _textWeather = "Снег";
  //     ImageWeather = Image.asset('icons/Snowy.png');
  //   } else if (weather == 'Rain') {
  //     _textWeather = "Дождь";
  //     ImageWeather = Image.asset('icons/Rainy.png');
  //   } else if (weather == 'Drizzle') {
  //     _textWeather = "Пасмурно";
  //     ImageWeather = Image.asset('icons/Rainy-Bulk.png');
  //   } else if (weather == "Thunderstorm") {
  //     _textWeather = "Гроза";
  //     ImageWeather = Image.asset('icons/RainThunder.png');
  //   } else if (_weatherDes == 'clear sky') {
  //     ImageWeather = Image.asset('icons/Sunny.png');
  //     _textWeather = "Чистое небо";
  //   }
  //   return Container(
  //     child: ImageWeather,
  //   );
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getWeather();
  // }

  @override
  Widget build(BuildContext context) {
    // if (_temp == null &&
    //     _name == null &&
    //     _weather == null &&
    //     _feelsLike == null) {
    //   return Scaffold(
    //     backgroundColor: Colors.blue,
    //     body: Center(child: CircularProgressIndicator(color: Colors.white)),
    //   );
    // }
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WeatherSochiScreenCubit, WeatherSochiScreenState>(
      builder: (context, state) {
        if (state is WeatherScreenEmptyState) {
          context.read<WeatherSochiScreenCubit>().fetchWeather("Kaliningrad");
        } else if (state is WeatherScreenErrorState) {
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
        } else if (state is WeatherScreenLoadedState) {
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
                          state.loadedWeather.nameTown,
                          style: const TextStyle(
                            fontSize: 30,
                            fontFamily: "OpenSans",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "${state.loadedWeather.temperature.toStringAsFixed(0)}\u00B0",
                        style: const TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 90,
                          color: Colors.white,
                        ),
                      ),
                      // Container(
                      //   child: Weathericon(context, _weather),
                      // ),
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 30,
                        ),
                        child: Text(
                          state.loadedWeather.main,
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
                                              state.loadedWeather.feelsLike
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
                                              '${state.loadedWeather.speedWind.toStringAsFixed(1)} м/c',
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

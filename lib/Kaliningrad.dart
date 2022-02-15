// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class KaliningradPage extends StatefulWidget {
  @override
  _KaliningradPageState createState() => _KaliningradPageState();
}

class _KaliningradPageState extends State<KaliningradPage> {
  var _temp;
  var _name;
  var _id;
  var _weather;
  var _weatherDes;
  var _feelsLike;
  var _TownName;
  var _textWeather;
  var _wind;

  Future getWeather() async {
    String city = "Kaliningrad";
    String apiKey = "4f835643d7ff653f90b1686997a64d12";
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      setState(() {
        _name = result['name'];
        _temp = result['main']["temp"];
        _weather = result['weather'][0]["main"];
        _feelsLike = result['main']["feels_like"];
        _weatherDes = result['weather'][0]['description"'];
        _wind = result['wind']['speed'];
      });
    } else {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator(color: Colors.white)],
            )
          ],
        ),
      );
    }
  }

  Widget Weathericon(BuildContext context, var weather) {
    late Image ImageWeather;
    if (weather == "Clouds") {
      _textWeather = "Облачно";
      ImageWeather = Image.asset('icons/PartlyCloudy-Bold.png');
    } else if (weather == "Clear") {
      _textWeather = "Ясно";
      ImageWeather = Image.asset('icons/PartlyCloudy-Bulk.png');
    } else if (weather == 'Snow') {
      _textWeather = "Снег";
      ImageWeather = Image.asset('icons/Snowy.png');
    } else if (weather == 'Rain') {
      _textWeather = "Дождь";
      ImageWeather = Image.asset('icons/Rainy.png');
    } else if (weather == 'Drizzle') {
      _textWeather = "Пасмурно";
      ImageWeather = Image.asset('icons/Rainy-Bulk.png');
    } else if (weather == "Thunderstorm") {
      _textWeather = "Гроза";
      ImageWeather = Image.asset('icons/RainThunder.png');
    } else if (_weatherDes == 'clear sky') {
      ImageWeather = Image.asset('icons/Sunny.png');
      _textWeather = "Чистое небо";
    }
    return Container(
      child: ImageWeather,
    );
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    if (_temp == null &&
        _name == null &&
        _weather == null &&
        _feelsLike == null) {
      return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 35),
                  child: Text(
                    _name.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "OpenSans",
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "${_temp.toStringAsFixed(1)}\u00B0",
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 90,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: Weathericon(context, _weather),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: Text(
                    _textWeather.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "OpenSans",
                      fontSize: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
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
                                      padding: EdgeInsets.only(top: 40),
                                      child: Text(
                                        'Ощущается как:',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontFamily: "OpenSans",
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 40),
                                      child: Text(
                                        _feelsLike.toStringAsFixed(1),
                                        style: TextStyle(
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
                                      padding: EdgeInsets.only(top: 40),
                                      child: Text(
                                        'Скорость ветра:',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontFamily: "OpenSans",
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 40),
                                      child: Text(
                                        '${_wind.toStringAsFixed(1)} м/c',
                                        style: TextStyle(
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
                                      child: TextButton(
                                        onPressed: () async {
                                          const _url =
                                              'https://www.google.com/search?q=%D0%A4%D0%BE%D1%82%D0%BE+%D0%9A%D0%B0%D0%BB%D0%B8%D0%BD%D0%B8%D0%BD%D0%B3%D1%80%D0%B0%D0%B4+4%D0%BA&tbm=isch&ved=2ahUKEwiMl4fBz4L2AhUBTMAKHTDFDcEQ2-cCegQIABAA&oq=%D0%A4%D0%BE%D1%82%D0%BE+%D0%9A%D0%B0%D0%BB%D0%B8%D0%BD%D0%B8%D0%BD%D0%B3%D1%80%D0%B0%D0%B4+4%D0%BA&gs_lcp=CgNpbWcQAzIHCCMQ7wMQJzoFCAAQgAQ6BggAEAcQHjoICAAQBxAFEB46CAgAEAgQBxAeUOIHWNcqYKAuaABwAHgAgAFeiAHqBZIBAjEzmAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=4RYMYsyiHIGYgQawireIDA&bih=961&biw=1920#imgrc=zQjfrx7pWUpUBM';
                                          if (await canLaunch(_url)) {
                                            await launch(_url);
                                          }
                                        },
                                        child: Text(
                                          'Ссылка на фото города:',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontFamily: "OpenSans",
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        child: Image.asset(
                                      'images/Kali.png',
                                      height: (size.height > 696) ? 150 : 0,
                                      width: (size.width > 454) ? 150 : 0,
                                    ))
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.only(bottom: 25),
                                child: ButtonTheme(
                                  minWidth: 248,
                                  height: 42,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: RaisedButton(
                                    child: Text(
                                      'Назад',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "OpenSans",
                                        fontSize: 16,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              )
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
}

// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_new, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageWeather extends StatefulWidget {
  @override
  _PageWeatherState createState() => _PageWeatherState();
}

class _PageWeatherState extends State<PageWeather> {
  var temp;
  var name;
  var id;
  Future getWeather() async {
    String city = "moscow";
    String apiKey = "4f835643d7ff653f90b1686997a64d12";
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey";
    var response = await http.get(Uri.parse(url));
    final result = jsonDecode(response.body);
    setState(() {
      name = result['name'];
      temp = result['main']["temp"];
      id = result['weather'][0]['id'];
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getWeather();
  // }

  @override
  Widget build(BuildContext context) {
    getWeather();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('APP'),
        ),
        body: Column(
          children: [
            Container(
              child: Center(
                child: Text(
                  name != null ? name.toString() : "Loading...",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            Container(
              child: Text(
                temp != null ? temp.toStringAsFixed(0) : 'Loading...',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

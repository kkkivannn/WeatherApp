import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/presentation/cubit/weather_cubit.dart';
import 'injection_container.dart';
import 'feature/presentation/pages/registration/registration_page.dart';

import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(create: (context) => sl<WeatherCubit>())
      ],
      child: const MaterialApp(
        home: RegistrationPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

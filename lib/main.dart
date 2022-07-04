import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/screens/kaliningrad/bloc/weather_kaliningrad_screen_cubit.dart';
import 'package:test_app/repositories/get_weather_town.dart';
import 'package:test_app/screens/kazan/bloc/weather_kazan_screen_cubit.dart';
import 'package:test_app/screens/moscow/bloc/weather_moscow_screen_cubit.dart';
import 'screens/registration_page.dart';
import 'screens/saint_petersburg/bloc/weather_saint_peterburg_screen_cubit.dart';
import 'screens/sochi/bloc/weather_sochi_screen_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherKaliningradScreenCubit(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => WeatherKazanScreenCubit(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => WeatherMoscowScreenCubit(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => WeatherSaintPeterburgScreenCubit(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => WeatherSochiScreenCubit(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          )
        ],
        child: const MaterialApp(
          home: RegistrationPage(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

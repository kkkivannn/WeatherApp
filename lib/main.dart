import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/data/repository/weather_repository_impl.dart';
import 'package:test_app/feature/domain/repositories/weather.dart';
import 'package:test_app/feature/presentation/cubit/weather_cubit.dart';
import 'package:test_app/screens/kaliningrad/bloc/weather_kaliningrad_screen_cubit.dart';
// import 'package:test_app/repositories/get_weather_town.dart';
import 'package:test_app/screens/kazan/bloc/weather_kazan_screen_cubit.dart';
import 'package:test_app/screens/moscow/bloc/weather_moscow_screen_cubit.dart';
import 'injection_container.dart';
import 'screens/registration_page.dart';
import 'screens/saint_petersburg/bloc/weather_saint_peterburg_screen_cubit.dart';
import 'screens/sochi/bloc/weather_sochi_screen_cubit.dart';
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
        ));
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (context) => WeatherKaliningradScreenCubit(
    //         weatherRepository: context.read<WeatherRepository>(),
    //       ),
    //     ),
    //     BlocProvider(
    //       create: (context) => WeatherKazanScreenCubit(
    //         weatherRepository: context.read<WeatherRepository>(),
    //       ),
    //     ),
    //     BlocProvider<WeatherCubit>(

    //       create: (context) => WeatherCubit(getWeather: context.read<WeatherRepository>(),),
    //       // create: (context) => WeatherMoscowScreenCubit(
    //       //   weatherRepository: context.read<WeatherRepository>(),
    //       // ),
    //     ),
    //     BlocProvider(
    //       create: (context) => WeatherSaintPeterburgScreenCubit(
    //         weatherRepository: context.read<WeatherRepository>(),
    //       ),
    //     ),
    //     BlocProvider(
    //       create: (context) => WeatherSochiScreenCubit(
    //         weatherRepository: context.read<WeatherRepository>(),
    //       ),
    //     )
    //   ],
    //   child: const MaterialApp(
    //     home: RegistrationPage(),
    //     debugShowCheckedModeBanner: false,
    //   ),
    // );
  }
}

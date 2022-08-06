// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'feature/presentation/pages/kaliningrad/controller/weather_kaliningrad_cubit.dart';
import 'feature/presentation/pages/kazan/controller/weather_kazan_cubit.dart';
import 'feature/presentation/pages/moscow/controller/weather_moscow_cubit.dart';
import 'feature/presentation/pages/registration/page/registration_page.dart';
import 'feature/presentation/pages/saint_petersburg/controller/weather_saint_peterburg_cubit.dart';
import 'feature/presentation/pages/sochi/controller/weather_sochi_cubit.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

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
        BlocProvider<WeatherMoscowCubit>(
          create: (context) => sl<WeatherMoscowCubit>(),
        ),
        BlocProvider<WeatherSaintPeterburgCubit>(
          create: (context) => sl<WeatherSaintPeterburgCubit>(),
        ),
        BlocProvider<WeatherKaliningradCubit>(
          create: (context) => sl<WeatherKaliningradCubit>(),
        ),
        BlocProvider<WeatherKazanCubit>(
          create: (context) => sl<WeatherKazanCubit>(),
        ),
        BlocProvider<WeatherSochiCubit>(
          create: (context) => sl<WeatherSochiCubit>(),
        ),
      ],
      child: const MaterialApp(
        home: RegistrationPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

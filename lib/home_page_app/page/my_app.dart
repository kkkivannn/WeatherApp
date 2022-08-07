// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/presentation/pages/home_page.dart/home.dart';
import 'package:test_app/feature/presentation/pages/registration/controller/sign_in_cubit.dart';
import '../../feature/presentation/pages/kaliningrad/controller/weather_kaliningrad_cubit.dart';
import '../../feature/presentation/pages/kazan/controller/weather_kazan_cubit.dart';
import '../../feature/presentation/pages/moscow/controller/weather_moscow_cubit.dart';
import '../../feature/presentation/pages/registration/page/registration_page.dart';
import '../../feature/presentation/pages/saint_petersburg/controller/weather_saint_peterburg_cubit.dart';
import '../../feature/presentation/pages/sochi/controller/weather_sochi_cubit.dart';
import '../../injection_container.dart';
import '../controller/my_app_cubit.dart';
import '../controller/my_app_state.dart';

// Project imports:

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
        BlocProvider<SignInCubit>(
          create: (context) => sl<SignInCubit>(),
        ),
        BlocProvider<MyAppCubit>(
          create: (context) => sl<MyAppCubit>(),
        ),
      ],
      child: BlocBuilder<MyAppCubit, MyAppState>(
        builder: (context, state) {
          if (state is MyAppEmptyState) {
            context.read<MyAppCubit>().getTokens();
            return const MaterialApp(
              home: RegistrationPage(),
              debugShowCheckedModeBanner: false,
            );
          }
          return const MaterialApp(
            home: CountOfTownWeather(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

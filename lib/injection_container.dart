// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:test_app/feature/data/datasources/weather_remote_data_source.dart';
import 'package:test_app/feature/data/datasources/weather_remote_data_source_implement.dart';
import 'package:test_app/feature/data/repository/sign_in_repository.dart';
import 'package:test_app/feature/data/repository/weather_repository_impl.dart';
import 'package:test_app/feature/domain/repositories/sign_in.dart';
import 'package:test_app/feature/domain/repositories/weather.dart';
import 'package:test_app/feature/domain/usecases/get_weather.dart';
import 'package:test_app/feature/domain/usecases/sign_in.dart';
import 'package:test_app/feature/presentation/pages/kazan/controller/weather_kazan_cubit.dart';
import 'package:test_app/feature/presentation/pages/moscow/controller/weather_moscow_cubit.dart';
import 'package:test_app/feature/presentation/pages/registration/controller/sign_in_cubit.dart';
import 'package:test_app/feature/presentation/pages/saint_petersburg/controller/weather_saint_peterburg_cubit.dart';
import 'package:test_app/home_page_app/controller/my_app_cubit.dart';
import 'feature/presentation/pages/kaliningrad/controller/weather_kaliningrad_cubit.dart';
import 'feature/presentation/pages/sochi/controller/weather_sochi_cubit.dart';

final sl = GetIt.asNewInstance();
Future<void> init() async {
  //Features - Weather
  //Cubit
  sl.registerFactory(() => WeatherKaliningradCubit(getWeather: sl()));
  sl.registerFactory(() => WeatherKazanCubit(getWeather: sl()));
  sl.registerFactory(() => WeatherMoscowCubit(getWeather: sl()));
  sl.registerFactory(() => WeatherSochiCubit(getWeather: sl()));
  sl.registerFactory(() => WeatherSaintPeterburgCubit(getWeather: sl()));
  sl.registerFactory(() => SignInCubit(signIn: sl()));
  sl.registerFactory(() => MyAppCubit());
  //UseCseses
  sl.registerLazySingleton(() => GetWeather(sl()));
  sl.registerLazySingleton(() => SignIn(sl()));
  //Repository
  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(sl()));
  sl.registerLazySingleton<SignInRepository>(() => SignInRepositoryImpl(sl()));
  //DataSource
  sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImplemet());
  //Core

  //External
}

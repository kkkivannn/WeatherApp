import 'package:get_it/get_it.dart';
import 'package:test_app/feature/data/datasources/weather_remote_data_source.dart';
import 'package:test_app/feature/data/datasources/weather_remote_data_source_implement.dart';
import 'package:test_app/feature/data/repository/weather_repository_impl.dart';
import 'package:test_app/feature/domain/repositories/weather.dart';
import 'package:test_app/feature/domain/usecases/get_weather.dart';
import 'package:test_app/feature/presentation/cubit/weather_cubit.dart';

final sl = GetIt.asNewInstance();
Future<void> init() async {
  //Features - Weather
  //Cubit
  sl.registerFactory(() => WeatherCubit(getWeather: sl()));
  //UseCseses
  sl.registerLazySingleton(() => GetWeather(sl()));
  //Repository
  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(sl()));
  //DataSource
  sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImplemet());
  //Core

  //External
}

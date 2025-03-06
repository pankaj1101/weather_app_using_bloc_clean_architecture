import 'package:get_it/get_it.dart';
import 'package:weather_bloc/core/network/network_api_services.dart';
import 'package:weather_bloc/features/weather/domain/repository/weather_repository.dart';

import 'features/weather/data/datasource/weather_remote_data_source.dart';
import 'features/weather/data/repository/weather_repository_impl.dart';
import 'features/weather/domain/usecases/getweather_usecase.dart';
import 'features/weather/presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //firebase insatnce

  // Core dependencies
  sl.registerSingleton<NetworkApiServices>(NetworkApiServices());

  // Data sources
  sl.registerSingleton<WeatherDataSource>(
      WeatherRemoteDataSource(sl<NetworkApiServices>()));

  sl.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(sl()));

  sl.registerSingleton<GetweatherUsecase>(GetweatherUsecase(sl()));

  // Blocs
  sl.registerFactory(() => WeatherBloc(sl()));
}

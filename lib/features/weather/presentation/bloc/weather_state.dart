part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  final bool isCelcius;

  const WeatherLoaded(this.weather, {this.isCelcius = true});

  @override
  List<Object> get props => [weather, isCelcius];

  WeatherLoaded copyWith({Weather? weather, bool? isCelcius}) {
    return WeatherLoaded(
      weather ?? this.weather,
      isCelcius: isCelcius ?? this.isCelcius,
    );
  }
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  List<Object> get props => [message];
}

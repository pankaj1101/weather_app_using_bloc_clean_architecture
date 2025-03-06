part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherRequested extends WeatherEvent {
  final String city;
  const WeatherRequested(this.city);
}

class WeatherInCelciusEvent extends WeatherEvent {
  final bool isCelcius;
  const WeatherInCelciusEvent({required this.isCelcius});
}

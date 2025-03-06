import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/weather.dart';
import '../../domain/usecases/getweather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetweatherUsecase getweatherUsecase;
  WeatherBloc(this.getweatherUsecase) : super(WeatherInitial()) {
    on<WeatherRequested>(_weatherRequested);
    on<WeatherInCelciusEvent>(_toggleTempEvent);
  }
  Future<void> _weatherRequested(
    WeatherRequested event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      emit(WeatherLoading());
      final weather = await getweatherUsecase.call(params: event.city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  FutureOr<void> _toggleTempEvent(
      WeatherInCelciusEvent event, Emitter<WeatherState> emit) {
    if (state is WeatherLoaded) {
      final currentState = state as WeatherLoaded;
      emit(currentState.copyWith(isCelcius: event.isCelcius));
    }
  }
}

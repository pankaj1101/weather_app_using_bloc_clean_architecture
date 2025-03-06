import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc/config/color/colors.dart';
import 'package:weather_bloc/core/routes/route_names.dart';
import 'package:weather_bloc/core/routes/routes.dart';
import 'package:weather_bloc/features/weather/presentation/widgets/addition_weather_info.dart';
import 'package:weather_bloc/features/weather/presentation/widgets/gradient_container.dart';
import 'package:weather_bloc/features/weather/presentation/widgets/weather_screen_appbar.dart';

import '../../../../core/utils/snackbars.dart';
import '../bloc/weather_bloc.dart';
import '../widgets/location.dart';
import '../widgets/temperature.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Completer<void> _refreshCompleter;
  String city = 'Pune';

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    context.read<WeatherBloc>().add(WeatherRequested(city));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        context.read<WeatherBloc>().add(WeatherRequested(city));
        return _refreshCompleter.future;
      },
      child: Scaffold(
        backgroundColor: Color(0xff0C0926),
        body: BlocConsumer<WeatherBloc, WeatherState>(listener: (_, state) {
          if (state is WeatherError) {
            SnackBarHelper.showError(context, state.message);
          }
          if (state is WeatherLoaded) {
            _refreshCompleter.complete();
            _refreshCompleter = Completer();
          }
        }, builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          if (state is WeatherError) {
            return Center(
                child: Text(
              state.message,
              style: TextStyle(
                color: Colors.white,
              ),
            ));
          }
          if (state is WeatherLoaded) {
            final weather = state.weather;
            final forecastday = state.weather.forecast!.forecastday;

            return Column(
              children: [
                weatherScreenAppBar(context, () async {
                  var data = await Navigator.push(
                    context,
                    Routes.generateRoute(
                      RouteSettings(
                        name: RouteNames.cityselectorScreen,
                      ),
                    ),
                  );
                  if (data != null) {
                    city = data;
                    context.read<WeatherBloc>().add(WeatherRequested(city));
                  }
                }),
                GradientContainer(
                  child: Column(
                    children: [
                      LocationWidget(weather: weather),
                      SizedBox(height: 20),
                      Temperature(weather: weather, isCelcius: state.isCelcius),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          children: [
                            Divider(color: AppColors.whiteColor),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AdditionalWeatherInfo(
                                  iconData: Icons.water_drop,
                                  temp: '${weather.humidity}%',
                                  title: 'Humidity',
                                ),
                                AdditionalWeatherInfo(
                                  iconData: Icons.air,
                                  temp: '${weather.windSpeedKph}km/h',
                                  title: 'Wind Speed',
                                ),
                                AdditionalWeatherInfo(
                                  iconData: Icons.beach_access,
                                  temp: '${weather.pressureMb} hPa',
                                  title: 'Pressure',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: forecastday!.length,
                    itemBuilder: (context, index) {
                      final forecastdayItem = forecastday[index];
                      DateTime dateTime = DateTime.parse(
                        forecastdayItem.date ?? '',
                      ); // Correct string format
                      String weekName =
                          DateFormat('EEE, d MMM').format(dateTime);

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Text(
                              weekName,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            Image.network(
                              'https:${forecastdayItem.day!.condition!.icon!}',
                            ),
                            Text(
                              forecastdayItem.day!.condition!.text ?? '',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            Text(
                              state.isCelcius
                                  ? '${forecastdayItem.day!.avgtempC} °'
                                  : '${forecastdayItem.day!.avgtempF} °',
                              style: const TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        }),
      ),
    );
  }
}

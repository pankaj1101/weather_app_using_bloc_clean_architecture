import 'package:flutter/material.dart';
import 'package:weather_bloc/core/routes/route_names.dart';
import 'package:weather_bloc/features/splash/presentation/pages/splash_screen.dart';
import 'package:weather_bloc/features/weather/presentation/pages/city_selector.dart';
import 'package:weather_bloc/features/weather/presentation/pages/weather_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case RouteNames.cityselectorScreen:
        return MaterialPageRoute(
          builder: (context) => CitySelector(),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => WeatherScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Route does not exist'),
            ),
          ),
        );
    }
  }
}

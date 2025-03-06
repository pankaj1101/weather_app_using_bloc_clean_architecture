import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_bloc/core/routes/route_names.dart';
import 'package:weather_bloc/core/routes/routes.dart';

class SplashServices {
  void navigateToHomeScreen(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          Routes.generateRoute(RouteSettings(name: RouteNames.homeScreen)),
          (route) => false,
        );
      },
    );
  }
}

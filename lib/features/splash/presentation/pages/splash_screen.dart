import 'package:flutter/material.dart';
import 'package:weather_bloc/features/splash/data/datasources/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashServices _splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    _splashServices.navigateToHomeScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.network(
            'https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather02-1024.png',
          ),
        ),
      ),
    );
  }
}

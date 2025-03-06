import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc/config/color/colors.dart';

import '../../domain/entities/weather.dart';

class Temperature extends StatelessWidget {
  final Weather weather;
  final bool isCelcius;

  const Temperature({
    super.key,
    required this.weather,
    required this.isCelcius,
  });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(weather.localtime);
    String weekName = DateFormat('EEE, d MMMM').format(dateTime);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(scale: 2, child: Image.network(weather.conditionIcon)),
        SizedBox(height: 10),
        Text(
          '${isCelcius ? weather.temperatureC : weather.temperatureF}°',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ),
        Text(
          weather.conditionText,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: Colors.yellow,
          ),
        ),
        Text(
          weekName,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_bloc/config/color/colors.dart';

class AdditionalWeatherInfo extends StatelessWidget {
  final IconData iconData;
  final String title, temp;

  const AdditionalWeatherInfo({
    super.key,
    required this.iconData,
    required this.title,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Icon(
          iconData,
          color: AppColors.whiteColor,
          size: 32,
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 16,
          ),
        ),
        Text(
          temp,
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}

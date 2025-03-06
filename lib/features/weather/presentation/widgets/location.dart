import 'package:flutter/material.dart';
import 'package:weather_bloc/config/color/colors.dart';

import '../../domain/entities/weather.dart';

class LocationWidget extends StatelessWidget {
  final Weather weather;
  const LocationWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_pin,
              color: AppColors.whiteColor,
              size: 30,
            ),
            Text(
              weather.locationName,
              style: TextStyle(
                fontSize: 30,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }
}

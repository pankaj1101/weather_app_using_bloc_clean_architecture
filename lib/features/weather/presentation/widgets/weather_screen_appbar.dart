import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/config/color/colors.dart';
import 'package:weather_bloc/features/weather/presentation/bloc/weather_bloc.dart';

AppBar weatherScreenAppBar(BuildContext context, VoidCallback onTapSearchIcon) {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xff06C7F1),
      title: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            return Switch(
              value: state.isCelcius,
              onChanged: (value) {
                context
                    .read<WeatherBloc>()
                    .add(WeatherInCelciusEvent(isCelcius: value));
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
      leading: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoaded) {
              return Text(
                state.isCelcius ? '°C' : '°F',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
      actions: [
        IconButton(
          onPressed:onTapSearchIcon,
          icon: Icon(
            Icons.search,
            color: AppColors.whiteColor,
            size: 25,
          ),
        ),
      ],
    );
  }

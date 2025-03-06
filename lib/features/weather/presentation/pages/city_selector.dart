import 'package:flutter/material.dart';
import 'package:weather_bloc/config/color/colors.dart';

class CitySelector extends StatefulWidget {
  const CitySelector({super.key});

  @override
  State<CitySelector> createState() => _CitySelectorState();
}

class _CitySelectorState extends State<CitySelector> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text('City'),
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter the city name',
                border: OutlineInputBorder(),
                hintText: 'Mumbai, India',
                suffixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context, _cityController.text.trim());
                  },
                  icon: Icon(Icons.search),
                ),
              ),
              onSubmitted: (_) {
                Navigator.pop(context, _cityController.text.trim());
              },
            ),
          )
        ],
      ),
    );
  }
}

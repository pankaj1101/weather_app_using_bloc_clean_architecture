import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/core/routes/route_names.dart';
import 'package:weather_bloc/core/routes/routes.dart';
import 'package:weather_bloc/injections_containers.dart';

import 'features/weather/presentation/bloc/weather_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<WeatherBloc>()),
      ],
      child: MaterialApp(
        title: 'Weather',
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather_app/Logic/LocationBloc/location_bloc.dart';
import 'package:weather_app/Logic/WeatherDataBloc/weather_data_bloc.dart';
import 'package:weather_app/Logic/WeatherSearchBloc/weather_search_bloc.dart';
import 'package:weather_app/Screens/InitialScreen/initial_screen.dart';

void main() {
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBloc()..add(GetInitialLocation()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => WeatherSearchBloc(),
        ),
        BlocProvider(
          create: (context) => WeatherDataBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const InitialScreen(),
      ),
    );
  }
}

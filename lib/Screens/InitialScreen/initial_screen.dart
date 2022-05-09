import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Components/getting_initial_data_component.dart';
import 'package:weather_app/Logic/LocationBloc/location_bloc.dart';
import 'package:weather_app/Logic/WeatherDataBloc/weather_data_bloc.dart';
import 'package:weather_app/Models/lat_lon_data.dart';
import 'package:weather_app/Screens/Home/Components/animated_background.dart';
import 'package:weather_app/Screens/Home/home_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (_, state) {
        if (state is! LocationInitial) {
          final LatLonData latLonData = state is LocationObtained
              ? LatLonData(
                  latitude: state.locationData.latitude,
                  longitude: state.locationData.longitude)
              : const LatLonData.emptyLocation();
          context.read<WeatherDataBloc>().add(
                GetWeatherForSelectedDataOrLocation(
                  latLonData: latLonData,
                  from: From.location,
                ),
              );
        }
      },
      builder: (context, state) {
        if (state is LocationInitial) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: AnimatedBackground(
              child: const GettingInitialDataComponent(),
            ),
          );
        }

        return const HomeScreen();
      },
    );
  }
}

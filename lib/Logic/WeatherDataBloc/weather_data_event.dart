part of 'weather_data_bloc.dart';

abstract class WeatherDataEvent extends Equatable {
  const WeatherDataEvent();
}

class GetWeatherForSelectedDataOrLocation extends WeatherDataEvent {
  final LatLonData? latLonData;
  final From? from;

  const GetWeatherForSelectedDataOrLocation(
      {this.latLonData, this.from = From.search});

  @override
  List<Object?> get props => [latLonData];
}

enum From { search, local, location }

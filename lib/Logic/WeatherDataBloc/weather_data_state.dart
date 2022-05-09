part of 'weather_data_bloc.dart';

abstract class WeatherDataState extends Equatable {
  const WeatherDataState();
}

class WeatherDataInitial extends WeatherDataState {
  @override
  List<Object?> get props => [];
}

class WeatherLoadInProgress extends WeatherDataState {
  @override
  List<Object?> get props => [];
}

class WeatherLoadSuccessful extends WeatherDataState {
  final WeatherDataList? weatherDataList;
  final int lastLoadedCityId;

  const WeatherLoadSuccessful(
      {required this.weatherDataList, required this.lastLoadedCityId});

  @override
  List<Object?> get props => [weatherDataList];
}

class WeatherLoadError extends WeatherDataState {
  final String error;

  const WeatherLoadError({required this.error});

  @override
  List<Object?> get props => [error];
}

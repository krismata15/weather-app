part of 'weather_search_bloc.dart';

abstract class WeatherSearchState extends Equatable {
  const WeatherSearchState();
}

class WeatherSearchInitial extends WeatherSearchState {
  @override
  List<Object> get props => [];
}

class WeatherSearchWaiting extends WeatherSearchState {
  @override
  List<Object?> get props => [];
}

class WeatherSearchLoading extends WeatherSearchState {
  final String query;

  const WeatherSearchLoading({required this.query});

  @override
  List<Object?> get props => [query];
}

class WeatherSearchLoaded extends WeatherSearchState {
  final List<CityWeather>? cities;

  const WeatherSearchLoaded({required this.cities});

  @override
  List<Object?> get props => [cities];
}

class WeatherSearchError extends WeatherSearchState {
  final String error;

  const WeatherSearchError({required this.error});

  @override
  List<Object?> get props => [error];
}

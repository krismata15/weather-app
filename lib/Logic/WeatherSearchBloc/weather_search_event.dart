part of 'weather_search_bloc.dart';

abstract class WeatherSearchEvent extends Equatable {
  const WeatherSearchEvent();
}

class CleanSearch extends WeatherSearchEvent {
  @override
  List<Object?> get props => [];
}

class InitSearch extends WeatherSearchEvent {
  const InitSearch({required this.query});

  final String query;

  @override
  List<Object?> get props => [query];
}

class EmitSearchComplete extends WeatherSearchEvent {
  final List<CityWeather>? cities;

  const EmitSearchComplete({required this.cities});

  @override
  List<Object?> get props => [cities];
}

class EmitSearchCompleteError extends WeatherSearchEvent {
  final String error;

  const EmitSearchCompleteError({required this.error});

  @override
  List<Object?> get props => [];
}

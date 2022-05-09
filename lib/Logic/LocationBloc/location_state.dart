part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
}

class LocationInitial extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationObtained extends LocationState {
  final LocationData locationData;

  const LocationObtained({required this.locationData});

  @override
  List<Object?> get props => [locationData.latitude, locationData.longitude];
}

class LocationError extends LocationState {
  final LocationStatus locationStatus;

  const LocationError({required this.locationStatus});

  @override
  List<Object?> get props => [locationStatus];
}

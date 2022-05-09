part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class GetInitialLocation extends LocationEvent {
  @override
  List<Object?> get props => [];
}

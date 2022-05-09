import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';
import 'package:weather_app/Services/location_service.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<GetInitialLocation>(getInitialLocation);
  }

  final LocationService _locationService = LocationService.instance;

  Future<void> getInitialLocation(
      GetInitialLocation event, Emitter<LocationState> emit) async {
    try {
      await _locationService.getLocation();

      emit(
        LocationObtained(locationData: _locationService.locationData!),
      );
    } catch (e) {
      emit(
        LocationError(locationStatus: _locationService.locationStatus),
      );
    }
  }
}

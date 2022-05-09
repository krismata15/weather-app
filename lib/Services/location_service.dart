import 'package:location/location.dart';

class LocationService {
  LocationService._();

  static final LocationService instance = LocationService._();

  LocationData? _locationData;
  LocationStatus _locationStatus = LocationStatus.serviceDisallow;

  LocationData? get locationData => _locationData;

  LocationStatus get locationStatus => _locationStatus;

  Future<void> getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          _locationStatus = LocationStatus.serviceDisallow;
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          _locationStatus = LocationStatus.noPermission;
          return;
        }
      }

      _locationStatus = LocationStatus.locationAcquired;
      _locationData =
          await location.getLocation().timeout(const Duration(seconds: 5));
    } catch (e) {
      _locationStatus = LocationStatus.locationError;
    }
  }
}

enum LocationStatus {
  serviceDisallow,
  noPermission,
  locationError,
  locationAcquired
}

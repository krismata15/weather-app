import 'package:equatable/equatable.dart';

class LatLonData extends Equatable {
  final double? latitude;
  final double? longitude;

  const LatLonData({required this.latitude, required this.longitude});

  const LatLonData.emptyLocation()
      : latitude = null,
        longitude = null;

  Map<String, double?> toJson() =>
      {'latitude': latitude, 'longitude': longitude};

  @override
  List<Object?> get props => [latitude, longitude];
}

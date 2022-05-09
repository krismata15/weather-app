import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/Models/lat_lon_data.dart';
import 'package:weather_app/Models/weather_data.dart';
import 'package:weather_app/Services/weather_service.dart';

part 'weather_data_event.dart';
part 'weather_data_state.dart';

class WeatherDataBloc extends Bloc<WeatherDataEvent, WeatherDataState> {
  WeatherDataBloc() : super(WeatherDataInitial()) {
    on<GetWeatherForSelectedDataOrLocation>(getWeatherDataOnLocationOrNull);
  }

  final Map<int, WeatherData> _weatherDataByCities = {};

  Future<void> getWeatherDataOnLocationOrNull(
      GetWeatherForSelectedDataOrLocation event, emit) async {
    emit(WeatherLoadInProgress());
    try {
      final WeatherData weatherData =
          await WeatherService.getCityWeatherWithForecast(
              event.latLonData ?? const LatLonData.emptyLocation());

      if (event.from != null && event.from == From.location) {
        weatherData.fromWhereData = FromWhereData.location;
      }

      _weatherDataByCities.update(
          weatherData.cityWeather!.id!, (value) => weatherData,
          ifAbsent: () => weatherData);

      emit(
        WeatherLoadSuccessful(
            weatherDataList:
                WeatherDataList(weatherDataByCities: _weatherDataByCities),
            lastLoadedCityId: weatherData.cityWeather!.id!),
      );
    } catch (e) {
      emit(WeatherLoadError(error: e.toString()));
    }
  }
}

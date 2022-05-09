import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Logic/WeatherDataBloc/weather_data_bloc.dart';
import 'package:weather_app/Models/city_weather.dart';
import 'package:weather_app/Models/lat_lon_data.dart';
import 'package:weather_app/Screens/Home/home_screen.dart';
import 'package:weather_app/utils/util_functions.dart';

class WeatherResultTile extends StatelessWidget {
  final CityWeather cityWeather;

  const WeatherResultTile({Key? key, required this.cityWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key(cityWeather.id.toString()),
      leading: CircleAvatar(
        child: CachedNetworkImage(
          imageUrl:
              'http://openweathermap.org/img/wn/${cityWeather.weather!.first.icon}@2x.png',
          placeholder: (context, url) => const CircleAvatar(),
          errorWidget: (context, url, error) => const CircleAvatar(),
        ),
      ),
      title: Text('${cityWeather.name}, ${cityWeather.sys!.country}'),
      subtitle: Text(
          '${cityWeather.main!.temp}° - ${parseWeatherDescriptionToEs(cityWeather.weather!.first.main)}'),
      trailing: Text(
        '${cityWeather.main!.tempMax}° / ${cityWeather.main!.tempMin}°',
        style: TextStyle(
          color: Colors.grey.shade600,
        ),
      ),
      onTap: () {
        context.read<WeatherDataBloc>().add(
              GetWeatherForSelectedDataOrLocation(
                latLonData: LatLonData(
                  latitude: cityWeather.coord?.lat,
                  longitude: cityWeather.coord?.lon,
                ),
                from: From.search,
              ),
            );
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false);
      },
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weatherAppMobile/Models/city_weather.dart';
import 'package:weatherAppMobile/Screens/Home/home_screen.dart';

class WeatherResultTile extends StatelessWidget {
  final CityWeather cityWeather;

  WeatherResultTile({@required this.cityWeather}) : assert(cityWeather != null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key(cityWeather.id.toString()),
      leading: CachedNetworkImage(
        imageUrl:
            'http://openweathermap.org/img/wn/${cityWeather.weather.first.icon}@2x.png',
        placeholder: (context, url) => CircleAvatar(),
        errorWidget: (context, url, error) => CircleAvatar(),
      ),
      title: Text('${cityWeather.name}, ${cityWeather.sys.country}'),
      subtitle:
          Text('${cityWeather.main.temp}° - ${cityWeather.weather.first.main}'),
      trailing: Text(
        '${cityWeather.main.tempMax}° / ${cityWeather.main.tempMin}°',
        style: TextStyle(
          color: Colors.grey.shade600,
        ),
      ),
      onTap: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    cityWeather: cityWeather,
                  )),
          (route) => false),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weatherAppMobile/Models/weather.dart';
import 'package:weatherAppMobile/Services/weather_service.dart';
import './Components/export_components.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool type = true;
  Color baseColor = Colors.white;
  bool isLoading = true;
  WeatherData weatherData;

  @override
  void initState() {
    super.initState();
    getDetailWeather();
  }

  void getDetailWeather() async {
    weatherData = await WeatherService.getCityWeatherWithForecast();

    setState(() {
      isLoading = false;
    });
  }

  List<Widget> forecastView() {
    return weatherData.cityWeatherDetails.daily
        .map((e) => NextDayWeatherCard(
              forecastData: e,
            ))
        .toList()
        .sublist(1, 4);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: baseColor,
              displayColor: baseColor,
            ),
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: baseColor,
            ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : AnimatedBackground(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(Duration(seconds: 1));
                  },
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LocationText(
                              city: weatherData.cityWeather.name,
                              countryCode: weatherData.cityWeather.sys.country,
                            ),
                            DateTextFormatted(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      MainWeatherView(
                        temp: weatherData.cityWeather.main.temp,
                        weather: weatherData.cityWeather.weather.first.main,
                        max: weatherData.cityWeather.main.tempMax,
                        min: weatherData.cityWeather.main.tempMin,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.10,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: forecastView(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

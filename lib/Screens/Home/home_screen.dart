import 'package:flutter/material.dart';
import 'package:weather_app/Components/error_handler_component.dart';
import 'package:weather_app/Components/loading_data_component.dart';
import 'package:weather_app/Logic/WeatherData/weather_data_logic.dart';
import 'package:weather_app/Logic/WeatherData/weather_state.dart';
import 'package:weather_app/Logic/WeatherSearch/weather_search_logic.dart';
import 'package:weather_app/Models/city_weather.dart';
import 'package:weather_app/Models/weather_data.dart';
import 'package:weather_app/Screens/Home/Components/animated_background.dart';
import 'package:weather_app/Screens/Home/Components/date_text_formatted.dart';
import 'package:weather_app/Screens/Home/Components/location_text.dart';
import 'package:weather_app/Screens/Home/Components/main_weather_view.dart';
import 'package:weather_app/Screens/Home/Components/next_day_weather_card.dart';
import 'package:weather_app/Screens/Search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  final CityWeather? cityWeather;

  HomeScreen({this.cityWeather});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WeatherDataLogicView logicViewWeather;
  WeatherSearchLogicView weatherSearchLogic =
      WeatherSearchLogicView.initialSearchState();

  @override
  void initState() {
    super.initState();
    logicViewWeather =
        WeatherDataLogicView.initialLocalData(widget.cityWeather);
  }

  void searchOption() async {
    await showSearch(
      context: context,
      delegate: WeatherSearch(
        logic: weatherSearchLogic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: Colors.white,
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
              onPressed: searchOption,
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: AnimatedBackground(
          child: RefreshIndicator(
            onRefresh: () async {
              logicViewWeather.getSelectedOption(widget.cityWeather);
            },
            child: StreamBuilder<WeatherState>(
                stream: logicViewWeather.weatherStream,
                builder: (context, AsyncSnapshot<WeatherState> snapshot) {
                  if (snapshot.hasData) {
                    final state = snapshot.data;
                    if (state is WeatherLoadInProgress) {
                      return LoadingDataComponent();
                    }

                    if (state is WeatherLoadSuccessful) {
                      WeatherData weatherData = state.weatherData!;
                      return HomeBodyWeather(
                        weatherData: weatherData,
                      );
                    }

                    if (state is WeatherLoadError) {
                      return ErrorHandlerComponent(
                        description: state.error,
                        retryHandler: () => logicViewWeather
                            .getSelectedOption(widget.cityWeather),
                      );
                    }
                  }

                  return SizedBox.expand();
                }),
          ),
        ),
      ),
    );
  }
}

class HomeBodyWeather extends StatelessWidget {
  final WeatherData weatherData;

  HomeBodyWeather({required this.weatherData}) : assert(weatherData != null);

  List<Widget> forecastView(WeatherData weatherData) {
    return weatherData.cityWeatherDetails!.daily!
        .map((e) => NextDayWeatherCard(
              forecastData: e,
            ))
        .toList()
        .sublist(1, 4);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationText(
                city: weatherData.cityWeather!.name,
                countryCode: weatherData.cityWeather!.sys!.country,
              ),
              DateTextFormatted(),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        MainWeatherView(
          temp: weatherData.cityWeather!.main!.temp,
          weather: weatherData.cityWeather!.weather!.first.main,
          max: weatherData.cityWeather!.main!.tempMax,
          min: weatherData.cityWeather!.main!.tempMin,
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
              children: forecastView(weatherData),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

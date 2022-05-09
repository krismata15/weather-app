import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Components/error_handler_component.dart';
import 'package:weather_app/Components/loading_data_component.dart';
import 'package:weather_app/Logic/WeatherDataBloc/weather_data_bloc.dart';
import 'package:weather_app/Logic/WeatherSearchBloc/weather_search_bloc.dart';
import 'package:weather_app/Models/weather_data.dart';
import 'package:weather_app/Screens/Home/Components/animated_background.dart';
import 'package:weather_app/Screens/Home/Components/date_text_formatted.dart';
import 'package:weather_app/Screens/Home/Components/location_text.dart';
import 'package:weather_app/Screens/Home/Components/main_weather_view.dart';
import 'package:weather_app/Screens/Home/Components/next_day_weather_card.dart';
import 'package:weather_app/Screens/Search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? _controller;
  int selectedIndex = 0;

  void searchOption() async {
    await showSearch(
      context: context,
      delegate: WeatherSearch(
        bloc: context.read<WeatherSearchBloc>(),
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
      child: AnimatedBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: searchOption,
              ),
            ],
          ),
          bottomNavigationBar: _BottomAppBar(selectedIndex: selectedIndex),
          body: BlocConsumer<WeatherDataBloc, WeatherDataState>(
            listener: (context, state) {
              if (state is WeatherLoadSuccessful) {
                List<WeatherData> weatherDataList =
                    state.weatherDataList!.weatherDataByCities.values.toList();
                int index = weatherDataList.indexWhere((element) =>
                    element.cityWeather!.id! == state.lastLoadedCityId);
                _controller ??= PageController(
                  initialPage: index,
                );
                selectedIndex = index;
                setState(() {});
              }
            },
            builder: (_, WeatherDataState state) {
              if (state is WeatherLoadInProgress) {
                return const LoadingDataComponent();
              }

              if (state is WeatherLoadSuccessful) {
                List<WeatherData> weatherDataList =
                    state.weatherDataList!.weatherDataByCities.values.toList();
                return PageView.builder(
                  controller: _controller,
                  onPageChanged: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemCount: weatherDataList.length,
                  itemBuilder: (context, index) => HomeBodyWeather(
                    weatherData: weatherDataList.elementAt(index),
                  ),
                );
              }

              if (state is WeatherLoadError) {
                return ErrorHandlerComponent(
                  description: state.error,
                  retryHandler: () => context.read<WeatherDataBloc>().add(
                        const GetWeatherForSelectedDataOrLocation(
                            latLonData: null),
                      ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class _BottomAppBar extends StatelessWidget {
  const _BottomAppBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherDataBloc, WeatherDataState>(
      builder: (context, state) {
        if (state is! WeatherLoadSuccessful) {
          return const SizedBox();
        }
        return ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: BottomAppBar(
              color: Colors.indigoAccent.withOpacity(0.9),
              elevation: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Opacity(
                        opacity: 0,
                        child: Icon(Icons.title),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...Iterable.generate(
                                state.weatherDataList!.weatherDataByCities
                                    .length,
                                (int index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: IndicatorForWeatherPage(
                                    index: index,
                                    selectedIndex: selectedIndex,
                                    isLocationType: state.weatherDataList!
                                            .weatherDataByCities.values
                                            .elementAt(index)
                                            .fromWhereData ==
                                        FromWhereData.location,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.circle_grid_3x3_fill,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class IndicatorForWeatherPage extends StatelessWidget {
  const IndicatorForWeatherPage({
    Key? key,
    required this.index,
    required this.selectedIndex,
    this.isLocationType = false,
  }) : super(key: key);

  final int index;
  final int selectedIndex;
  final bool isLocationType;

  @override
  Widget build(BuildContext context) {
    return isLocationType
        ? Icon(
            CupertinoIcons.location_fill,
            size: 14,
            color: selectedIndex == index ? Colors.white : Colors.grey.shade400,
          )
        : Container(
            key: ValueKey('bullet_index_$index'),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  selectedIndex == index ? Colors.white : Colors.grey.shade400,
            ),
          );
  }
}

class HomeBodyWeather extends StatelessWidget {
  final WeatherData weatherData;

  const HomeBodyWeather({Key? key, required this.weatherData})
      : super(key: key);

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
              Row(
                children: [
                  LocationText(
                    city: weatherData.cityWeather!.name,
                    countryCode: weatherData.cityWeather!.sys!.country,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (weatherData.fromWhereData == FromWhereData.location)
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Icon(
                        CupertinoIcons.location_fill,
                      ),
                    ),
                ],
              ),
              const DateTextFormatted(),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        MainWeatherView(
          temp: weatherData.cityWeather!.main!.temp,
          weather: weatherData.cityWeather!.weather!.first.main,
          max: weatherData.cityWeather!.main!.tempMax,
          min: weatherData.cityWeather!.main!.tempMin,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
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
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

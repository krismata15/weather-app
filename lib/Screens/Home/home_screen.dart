import 'package:flutter/material.dart';
import './Components/export_components.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool type = true;
  Color baseColor = Colors.white;

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
        body: AnimatedBackground(
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
            },
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocationText(
                        city: 'Caracas',
                        countryCode: 'VE',
                      ),
                      DateTextFormatted(),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                MainWeatherView(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherCard(),
                        WeatherCard(),
                        WeatherCard(),
                      ],
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

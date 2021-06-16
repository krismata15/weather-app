import 'package:flutter/material.dart';
import 'package:weatherAppMobile/Logic/WeatherSearch/weather_search_logic.dart';
import 'package:weatherAppMobile/Logic/WeatherSearch/weather_search_state.dart';
import 'package:weatherAppMobile/Screens/Search/Components/search_results_list.dart';

class WeatherSearch extends SearchDelegate {
  WeatherSearch({@required this.logic}) : assert(logic != null);

  final WeatherSearchLogicView logic;

  @override
  String get searchFieldLabel => 'Ingrese el nombre de su ciudad';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
            logic.initial();
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    logic.initSearch(query);
    return StreamBuilderDelegate(
      stream: logic.searchStream,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    logic.initSearch(query);
    return StreamBuilderDelegate(
      stream: logic.searchStream,
    );
  }
}

class StreamBuilderDelegate extends StatelessWidget {
  final Stream<WeatherSearchState> stream;

  StreamBuilderDelegate({@required this.stream}) : assert(stream != null);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WeatherSearchState>(
        stream: stream,
        builder: (context, AsyncSnapshot<WeatherSearchState> snapshot) {
          if (snapshot.hasData) {
            final state = snapshot.data;

            if (state is SearchWaiting) {
              return SizedBox();
            }

            if (state is SearchLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is SearchLoaded) {
              if (state.cities.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/clima_1.png',
                        scale: 3,
                      ),
                      Text(
                        'No hay resultados\nIntente con otros parámetros de búsqueda',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }
              return SearchResults(
                cities: state.cities,
              );
            }
          }
          return SizedBox();
        });
  }
}

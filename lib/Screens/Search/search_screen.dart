import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Components/error_handler_component.dart';
import 'package:weather_app/Components/loading_data_component.dart';
import 'package:weather_app/Logic/WeatherSearchBloc/weather_search_bloc.dart';
import 'package:weather_app/Screens/Search/Components/search_results_list.dart';

class WeatherSearch extends SearchDelegate {
  WeatherSearch({required this.bloc});

  final WeatherSearchBloc bloc;

  @override
  String get searchFieldLabel => 'Ingrese el nombre de su ciudad';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            bloc.add(CleanSearch());
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    bloc.add(InitSearch(query: query));
    return BlocProvider.value(
      value: bloc,
      child: const BodyBuilderDelegate(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    bloc.add(InitSearch(query: query));
    return BlocProvider.value(
      value: bloc,
      child: const BodyBuilderDelegate(),
    );
  }
}

class BodyBuilderDelegate extends StatelessWidget {
  const BodyBuilderDelegate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherSearchBloc, WeatherSearchState>(
        builder: (context, state) {
      if (state is WeatherSearchWaiting) {
        return const SizedBox();
      }

      if (state is WeatherSearchLoading) {
        return const LoadingDataComponent(
          title: 'Buscando',
        );
      }

      if (state is WeatherSearchLoaded) {
        if (state.cities!.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/clima_1.png',
                  scale: 3,
                ),
                const Text(
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

      if (state is WeatherSearchError) {
        return ErrorHandlerComponent(
          description: state.error,
        );
      }
      return const SizedBox();
    });
  }
}

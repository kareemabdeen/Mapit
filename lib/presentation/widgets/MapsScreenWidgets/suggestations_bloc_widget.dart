import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../Buisness_Logic/cubits/Maps_cubit/maps_cubit.dart';
import '../../../Data/models/places_suggestations.dart';
import '../MapsScreenWidgets/suggestations_list_view_widget.dart';

class SuggestationsBloc extends StatefulWidget {
  const SuggestationsBloc({super.key, required this.searchController});
  final FloatingSearchBarController searchController;

  @override
  State<SuggestationsBloc> createState() => _SuggestationsBlocState();
}

class _SuggestationsBlocState extends State<SuggestationsBloc> {
  List<PlacesSuggestations> places = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is PlacesLoaddedsuccesfully) {
          places = (state).places;
          log(places.toString());
          if (places.isNotEmpty) {
            return SuggestationListView(
              // todo : be focus dont miss to putting return statment again !!
              suggestedPlaces: places,
              searchController: widget.searchController,
            );
          } else {
            return Container();
          }
        }
        return Container();
      },
    );
  }
}

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Buisness_Logic/cubits/Maps_cubit/maps_cubit.dart';
import '../../helpers/location_helper.dart';
import '../widgets/MapsScreenWidgets/custom_floating_button_widget.dart';
import '../widgets/MapsScreenWidgets/custom_floating_search_bar_widget.dart';
import '../widgets/UserDrawerWidgets/custom_drawer_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static Position? position;
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>(); //Todo : should be closed
  late Set<Marker> markers = {}; // passing to cubit

  static final CameraPosition currentUserCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );

  @override
  void initState() {
    super.initState();
    determineUserCurrentLocation();
  }

  //! mapsScreenBody
  Widget buildMaps() {
    return GoogleMap(
      markers: newMethod(), // context.of<MapsScreen>.markers
      initialCameraPosition: currentUserCameraPosition,
      mapType: MapType.normal,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      myLocationEnabled: true, // circled blue point on my map
      //*Callback method for when the map is ready to be used.
      //* Used to receive a [GoogleMapController] for this [GoogleMap].
      onMapCreated: (GoogleMapController controller) {
        //*All listeners on the future are informed about the value. => _mapController.future;
        _mapController.complete(controller);
      },
    );
  }

  Set<Marker> newMethod() {
    log("55555555555555=> ${BlocProvider.of<MapsCubit>(context).markers}");
    return BlocProvider.of<MapsCubit>(context).markers ?? {};
  }

  // Widget buildMarkerBloc() {
  //   return BlocBuilder<MapsCubit, MapsState>(
  //     bloc: getIt<MapsCubit>(),
  //     builder: (context, state) {
  //       if (state is MarkersLoaded) {
  //         markers = (state).markers;
  //         log('======================= $markers');
  //       }
  //       return Container();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Stack(
        // in order to put the seachbar over the map screen
        fit: StackFit.expand, //*FloatingSearchBar docs
        children: [
          (position != null)
              ? buildMaps()
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
          CustomFloatingSearchBar(
            mapController: _mapController,
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: _goToMyCurrentLocation,
      ),
    );
  }

  Future<void> determineUserCurrentLocation() async {
    position = await LocationHelper.detremineUserCurrentLocation().whenComplete(
      () {
        setState(
          () {
            // rebuild for the screen to update user current location on map .
          },
        );
      },
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    // called when onMapCreated function is done and map screen is build with its appropriate enviroment
    final GoogleMapController controller = await _mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(currentUserCameraPosition),
    );
    saveUserCameraPositionOnMapCubit();
  }

  void saveUserCameraPositionOnMapCubit() {
    BlocProvider.of<MapsCubit>(context).currentUserCameraPosition =
        currentUserCameraPosition;
  }
}

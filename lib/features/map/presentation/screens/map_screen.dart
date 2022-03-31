import 'dart:async';

import 'package:fltuter_web_map/core/constants/map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VoloMapScreen extends StatefulWidget {
  static const String routeName = 'map';
  const VoloMapScreen({Key? key}) : super(key: key);

  @override
  State<VoloMapScreen> createState() => _VoloMapScreenState();
}

class _VoloMapScreenState extends State<VoloMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? latLng;

  Set<Marker> _getMarketPostionMarker() {
    return latLng != null
        ? {Marker(markerId: MarkerId(latLng.toString()), position: latLng!)}
        : {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: _getMarketPostionMarker(),
        onTap: (argument) {
          setState(() {
            latLng = argument;
          });
        },
        mapType: MapType.normal,
        initialCameraPosition: MapCostants.kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(MapCostants.kLake));
  }
}

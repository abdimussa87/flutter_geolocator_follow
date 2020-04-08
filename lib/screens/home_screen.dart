import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_follow/services/geolocator_service.dart';

class HomeScreen extends StatefulWidget {
  final Position initialPostion;

  const HomeScreen({Key key, this.initialPostion}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();

@override
  void initState() {
   GeolocatorService.getCurrentPosition().listen((position){
     centerScreen(position);
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialPostion.latitude,
            widget.initialPostion.longitude,
          ),
          zoom: 30,
        ),
        mapType: MapType.satellite,
        myLocationEnabled: true,
      ),
    );
  }

  centerScreen(Position position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            position.latitude,
            position.longitude,
          ),
        ),
      ),
    );
  }
}

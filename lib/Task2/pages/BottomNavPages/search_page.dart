import 'dart:async';

import 'package:day1/Task2/model/searchusers_map_model.dart';
import 'package:day1/Task2/service/search_api.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = LatLng(23.049653, 72.6703189);
  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  SearchApi controller = SearchApi();

  List<Marker> markers = [];

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onAddMarkerButtonPressed() {
    controller.searchUserMap().then((value) {
      for (int i = 0; i < value.data.length; i++) {
        _markers.add(
          Marker(
              markerId: MarkerId(value.data[i].id.toString()),
              position: LatLng(double.parse(value.data[i].lat),
                  double.parse(value.data[i].lng)),
              infoWindow: InfoWindow(title: value.data[i].username),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed)),
        );
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    friendsMarker();
  }

  friendsMarker() {
    controller.searchUserMap().then((value) {
      for (int i = 0; i < value.data.length; i++) {
        _markers.add(
          Marker(
              markerId: MarkerId(value.data[i].id.toString()),
              position: LatLng(double.parse(value.data[i].lat),
                  double.parse(value.data[i].lng)),
              infoWindow: InfoWindow(title: value.data[i].username),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed)),
        );
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
        ],
      ),
    );
  }
}

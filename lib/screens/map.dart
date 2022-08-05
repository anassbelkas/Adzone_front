import 'package:adzone/routes.dart';
import 'package:flutter/material.dart';
import 'package:adzone/theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:adzone/main.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class Map extends StatefulWidget {
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  GoogleMapController mapController;

  static const LatLng sourceLocation = const LatLng(37.33500926, -122.03272188);
  static const LatLng destination = const LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyCFve7wYraKElZTBz0tHxbJ3wX5wgr_-4s',
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polylineCoordinates.add(LatLng(point.latitude, point.longitude)));
      setState(() {});
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Map"),
          backgroundColor: Colors.amber[600],
        ),
        body: Container(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: sourceLocation,
              zoom: 13.5,
            ),
            polylines: {
              Polyline(
                  polylineId: PolylineId('route'),
                  points: polylineCoordinates,
                  color: Colors.blue,
                  width: 6),
            },
            markers: {
              const Marker(
                  markerId: MarkerId('source'), position: sourceLocation),
              const Marker(
                  markerId: MarkerId('destination'), position: destination)
            },
          ),
        ));
  }
}

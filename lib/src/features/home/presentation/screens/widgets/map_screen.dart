import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:dio/dio.dart';
import 'dart:async';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _initialPosition = LatLng(37.77483, -122.41942); // San Francisco
  static const LatLng _destinationPosition = LatLng(34.05223, -118.24368); // Los Angeles

  List<LatLng> polylineCoordinates = [];
  Set<Polyline> _polylines = {};
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarkers();
    _getPolyline();
  }

  void _addMarkers() {
    _markers.add(Marker(
      markerId: MarkerId('start'),
      position: _initialPosition,
      infoWindow: InfoWindow(title: 'San Francisco'),
    ));
    _markers.add(Marker(
      markerId: MarkerId('end'),
      position: _destinationPosition,
      infoWindow: InfoWindow(title: 'Los Angeles'),
    ));
  }

  Future<void> _getPolyline() async {
    String googleAPIKey = 'YOUR_GOOGLE_MAPS_API_KEY';
    Dio dio = Dio();

    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${_initialPosition.latitude},${_initialPosition.longitude}&destination=${_destinationPosition.latitude},${_destinationPosition.longitude}&key=AIzaSyCa7_YMNCjGJuVf6XN291zUkIGwuzNv4og';

    try {
      // درخواست HTTP با استفاده از dio
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = response.data;

        if (jsonResponse['routes'] != null && jsonResponse['routes'].isNotEmpty) {
          List<dynamic> legs = jsonResponse['routes'][0]['legs'];
          for (var leg in legs) {
            for (var step in leg['steps']) {
              var startLatLng = LatLng(step['start_location']['lat'],
                  step['start_location']['lng']);
              var endLatLng = LatLng(
                  step['end_location']['lat'], step['end_location']['lng']);
              polylineCoordinates.add(startLatLng);
              polylineCoordinates.add(endLatLng);
            }
          }
        }
      }
    } catch (e) {
      print("Error fetching directions: $e");
    }

    setState(() {
      _polylines.add(Polyline(
        polylineId: PolylineId('route'),
        points: polylineCoordinates,
        width: 6,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps with Dio and Directions'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 7,
        ),
        polylines: _polylines,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class ParsiMap extends StatefulWidget {
  const ParsiMap({Key? key}) : super(key: key);

  @override
  State<ParsiMap> createState() => _ParsiMapState();
}

class _ParsiMapState extends State<ParsiMap> {
  final MapController mapController = MapController();

  // مکان پیش‌فرض (تهران)
  LatLng location = const LatLng(35.6892, 51.3890);
  double lat = 35.6892;
  double lng = 51.3890;

  @override
  Widget build(BuildContext context) {
    const String parsiMapApiToken =
        'p133a42ed78f324f7787c67c45de3d44a363398b54';
    const String parsiMapUrlTemplate =
        'https://api.parsimap.ir/tile/parsimap-streets-v11-raster/{z}/{x}/{y}?key=$parsiMapApiToken';

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            keepAlive: true,
            initialCenter: location,
            initialZoom: 14,
            onPositionChanged: (position, hasGesture) {
              if (hasGesture) {
                setState(() {
                  location = position.center;
                });
              }
            }
          ),
          children: [
            TileLayer(
              urlTemplate: parsiMapUrlTemplate,
              additionalOptions: {
                'key': parsiMapApiToken,
              },
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: location,
                  width: 80,
                  height: 80,
                  child: const Icon(
                    Icons.location_on_outlined,
                    size: 35,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

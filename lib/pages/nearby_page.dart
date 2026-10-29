import 'package:first_app/components/toolbar.dart';
import 'package:first_app/config/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    const sylhet = LatLng(24.8949, 91.8687);

    return Scaffold(
      appBar: Toolbar(title: AppStrings.nearby),
      body: SizedBox.expand(
        child: FlutterMap(
          options: const MapOptions(initialCenter: sylhet, initialZoom: 13),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.first_app',
              errorTileCallback: (tile, error, stackTrace) {
                debugPrint('Map tile error: $error');
              },
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: sylhet,
                  width: 45,
                  height: 45,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40,
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

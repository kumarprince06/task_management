import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _initialPosition = LatLng(37.7749, -122.4194); // San Francisco

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // Set height for the container
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12.0, // Valid zoom level (between 0 and 21)
        ),
        zoomControlsEnabled: false, // Hide zoom buttons
        zoomGesturesEnabled: true,  // Enable pinch-to-zoom
        scrollGesturesEnabled: true, // Allow map scrolling
        myLocationEnabled: true, // Enable location button
        myLocationButtonEnabled: false, // Enable pinch-to-zoom
      ),
    );
  }
}

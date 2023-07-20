import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:nesco/constant.dart';

// void main() => runApp(const MyApp());

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  LocationData? currentLocation;

  final LatLng garageLocation =
      const LatLng(5.977150781147969, 10.182959938419708);
  final LatLng washingPointLocation =
      const LatLng(6.005766701611963, 10.263633464421183);

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      setState(() {
        currentLocation = location;
      });
    });

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((location) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(location.latitude!, location.longitude!),
            zoom: 15,
          ),
        ),
      );
      setState(() {
        currentLocation = location;
      });
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Garage Location')),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: currentLocation == null
                ? const Center(child: Text("Loading"))
                : GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!),
                      zoom: 15,
                    ),
                    markers: {
                      Marker(
                          markerId: const MarkerId('Current Location'),
                          position: LatLng(currentLocation!.latitude!,
                              currentLocation!.longitude!),
                          infoWindow: InfoWindow(title: "Your location")),
                      Marker(
                        markerId: const MarkerId('Source'),
                        position: garageLocation,
                        infoWindow: InfoWindow(title: "Garage"),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueBlue),
                      ),
                    },
                    polylines: {
                      Polyline(
                        polylineId: PolylineId('line'),
                        points: [
                          garageLocation,
                          currentLocation == null
                              ? washingPointLocation
                              : LatLng(currentLocation!.latitude!,
                                  currentLocation!.longitude!),
                        ],
                        width: 5,
                        color: kPrimaryColor,
                      )
                    },
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
          ),
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/image/venza3.png', // replace with your image path
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Nesco Car Garage",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                            " We provide precision auto repair and maintenance services, ensuring the highest standard of quality and safety for your vehicle. Our experienced mechanics specialize in servicing a variety of makes and models."),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

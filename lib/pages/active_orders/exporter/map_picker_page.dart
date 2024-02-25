import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPickerPage extends StatefulWidget {
  const MapPickerPage({super.key});

  @override
  State<MapPickerPage> createState() => _MapPickerPageState();
}

class _MapPickerPageState extends State<MapPickerPage> {
  GoogleMapController? _controller;
  LatLng _userLocation = const LatLng(41.310996, 69.280038);

  late LatLng _lastMapPosition;

  @override
  void initState() {
    super.initState();
    _getLocationPermission();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _getLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle denied permission
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle permanently denied permission
      return;
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      _getCurrentLocation();
    }
  }

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _userLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SafeArea(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: _onCameraMove,
          mapType: MapType.terrain,
          initialCameraPosition:
              CameraPosition(target: _userLocation, zoom: 16.0),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
        ),
      ),
      Container(
        padding: const EdgeInsets.only(bottom: 18),
        child: Center(
            child: Icon(
          Icons.location_on,
          color: AppColors.red,
          size: 36,
        )),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: PrimaryButton(
              text: "select".tr(),
              onPressed: () {
                print(_lastMapPosition.latitude);
                print(_lastMapPosition.longitude);
              }),
        ),
      )
    ]));
  }
}

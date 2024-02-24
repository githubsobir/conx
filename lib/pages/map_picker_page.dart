import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/primary_button.dart';
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
    getUserPosition().then(
        (value) => _userLocation = LatLng(value.latitude, value.longitude));

    _lastMapPosition = _userLocation;
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  Future<Position> getUserPosition() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      GoogleMap(

          onMapCreated: _onMapCreated,
          onCameraMove: _onCameraMove,
          mapType: MapType.terrain,
          initialCameraPosition: CameraPosition(
            zoom: 16,
              target: LatLng(_userLocation.latitude, _userLocation.longitude))),
      Container(
        padding: const EdgeInsets.only(bottom: 18),
        child: Center(
            child: Icon(Icons.location_on, color: AppColors.red, size: 36,)),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: PrimaryButton(
              text: "Select",
              onPressed: () {
                print(_lastMapPosition.latitude);
                print(_lastMapPosition.longitude);
              }),
        ),
      )
    ]));
  }
}

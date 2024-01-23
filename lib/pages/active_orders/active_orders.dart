import 'dart:async';

import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ActiveOrders extends StatefulWidget {
  const ActiveOrders({super.key});

  @override
  State<ActiveOrders> createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> with AutomaticKeepAliveClientMixin{
  final Completer<GoogleMapController> _controller = Completer();

  var initilaPos = const CameraPosition(
      target: LatLng(41.28173821015948, 69.2168272435665), zoom: 13);

  final List<Marker> myMarker = [];
  final List<Marker> markerList = [
    const Marker(
      markerId: MarkerId("Birinchi buyrutma"),
      position: LatLng(41.292164081608206, 69.21975235329468),
      infoWindow: InfoWindow(
        title: "Meva sabzavotlar",
      ),
    ),
    const Marker(
      markerId: MarkerId("Ikkinchi buyrutma"),
      position: LatLng(41.282164081608206, 69.21975235329468),
      infoWindow: InfoWindow(
        title: "Mettal maxsulotlar",
      ),
    ),
    const Marker(
      markerId: MarkerId("3-buyrutma"),
      position: LatLng(41.292564081608206, 69.23575235329468),
      infoWindow: InfoWindow(
        title: "Mening uyim 3",
      ),
    ),
    const Marker(
      markerId: MarkerId("4- buyrutma"),
      position: LatLng(41.292664081608206, 69.21675235329468),
      infoWindow: InfoWindow(
        title: "Meva sabzavotlar",
      ),
    ),
    const Marker(
      markerId: MarkerId("5- buyrutma"),
      position: LatLng(41.281164081608206, 69.21275235329468),
      infoWindow: InfoWindow(
        title: "6- maxsulotlar",
      ),
    ),
    const Marker(
      markerId: MarkerId("7-buyrutma"),
      position: LatLng(41.290164081608206, 69.23075235329468),
      infoWindow: InfoWindow(
        title: "Mening uyim 3",
      ),
    ),
  ];

  @override
  void initState() {
    myMarker.addAll(markerList);
    packData();
    super.initState();
  }

  Future<Position> getUserPosition() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  packData() {
    getUserPosition().then((value) async {
      print("my location");
      print(value.latitude.toString() + " " + value.longitude.toString());

      myMarker.add(Marker(
          markerId: const MarkerId("joylashuvim"),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: "joylashuvim")));
      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 14,
      bearing: 0
      );
      final GoogleMapController controller1 = await _controller.future;

      controller1.animateCamera(CameraUpdate.newCameraPosition(cameraPosition, ));

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade400,
        title: Text("KARTA", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(1, 1, 20, 5),
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              decoration:
                  BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              child: Center(child: Icon(Icons.add_alert_rounded)),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.grey.shade400),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(CupertinoIcons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            fillColor: Colors.grey.shade50,
                            filled: true),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.colorBackground),
                        child: const Icon(Icons.settings_ethernet_rounded,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: initilaPos,
                mapType: MapType.normal,
                markers: Set<Marker>.of(myMarker),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.location_searching),
      //     onPressed: () async {
      //       // GoogleMapController googleMapController = await _controller.future;
      //       //
      //       // googleMapController.animateCamera(CameraUpdate.newCameraPosition(
      //       //     const CameraPosition(
      //       //         target: LatLng(41.48173821015948, 69.4168272435665),
      //       //         zoom: 14)));
      //       packData();
      //       // setState(() {});
      //     }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

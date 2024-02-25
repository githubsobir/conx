import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/pages/active_orders/driver/info_window/info_window.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../generated/assets.dart';
import '../../../widgets/primary_button.dart';

class DriverOrders extends StatefulWidget {
  const DriverOrders({super.key});

  @override
  State<DriverOrders> createState() => _DriverOrdersState();
}

class _DriverOrdersState extends State<DriverOrders>
    with AutomaticKeepAliveClientMixin {
  final Completer<GoogleMapController> _controller = Completer();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  var initilaPos = const CameraPosition(
      target: LatLng(41.28173821015948, 69.2168272435665), zoom: 13);

  final List<Marker> myMarker = [];
  List<Marker> markerList = [];

  var isAllOrdersShowed = false;

  loadData() {
    myMarker.addAll([
      Marker(
          markerId: MarkerId("Birinchi buyrutma"),
          position: LatLng(41.292164081608206, 69.21975235329468),
          infoWindow: InfoWindow(title: "Meva sabzavotlar"),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              CustomInfoWindows(id: 0),
              LatLng(41.292164081608206, 69.21975235329468),
            );
          }),
      Marker(
          markerId: MarkerId("Ikkinchi buyrutma"),
          position: LatLng(41.282164081608206, 69.21975235329468),
          infoWindow: InfoWindow(
            title: "Mettal maxsulotlar",
          ),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              CustomInfoWindows(id: 1),
              LatLng(41.292164081608206, 69.21975235329468),
            );
          }),
      Marker(
          markerId: MarkerId("3-buyrutma"),
          position: LatLng(41.292564081608206, 69.23575235329468),
          infoWindow: InfoWindow(
            title: "Mening uyim 3",
          ),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              CustomInfoWindows(id: 2),
              LatLng(41.292164081608206, 69.21975235329468),
            );
          }),
      Marker(
          markerId: MarkerId("4- buyrutma"),
          position: LatLng(41.292664081608206, 69.21675235329468),
          infoWindow: InfoWindow(
            title: "Meva sabzavotlar",
          ),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              CustomInfoWindows(id: 3),
              LatLng(41.292164081608206, 69.21975235329468),
            );
          }),
      Marker(
          markerId: MarkerId("5- buyrutma"),
          position: LatLng(41.281164081608206, 69.21275235329468),
          infoWindow: InfoWindow(
            title: "6- maxsulotlar",
          ),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              CustomInfoWindows(id: 4),
              LatLng(41.292164081608206, 69.21975235329468),
            );
          }),
      const Marker(
        markerId: MarkerId("7-buyrutma"),
        position: LatLng(41.290164081608206, 69.23075235329468),
        infoWindow: InfoWindow(
          title: "Mening uyim 3",
        ),
      ),
    ]);
  }

  @override
  void initState() {
    loadData();
    // packData();
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
          target: LatLng(value.latitude, value.longitude),
          zoom: 14,
          bearing: 0);
      final GoogleMapController controller1 = await _controller.future;

      controller1.animateCamera(CameraUpdate.newCameraPosition(
        cameraPosition,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade400,
        title: Text("KARTA",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
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
        child: Stack(children: [
          Column(
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
                child: Stack(children: [
                  GoogleMap(
                    initialCameraPosition: initilaPos,
                    mapType: MapType.normal,
                    markers: Set<Marker>.of(myMarker),
                    onTap: (argument) {
                      _customInfoWindowController.hideInfoWindow!();
                    },
                    onCameraMove: (position) {
                      _customInfoWindowController.onCameraMove!();
                    },
                    onMapCreated: (GoogleMapController controller) {
                      // _controller.complete(controller);
                      _customInfoWindowController.googleMapController =
                          controller;
                    },
                  ),
                  CustomInfoWindow(
                    controller: _customInfoWindowController,
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.75,
                    offset: 50,
                  )
                ]),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    isAllOrdersShowed = !isAllOrdersShowed;
                    setState(() {});
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 48,
                      width: 198,
                      decoration: BoxDecoration(
                          color: AppColors.white100,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.iconsIcOrders,
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            (isAllOrdersShowed) ? "Hide orders" : "Show orders",
                            style: const TextStyle(
                                color: Color.fromRGBO(111, 127, 106, 1),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Visibility(
                  visible: isAllOrdersShowed,
                  child: SizedBox(
                    height: 192,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.white100,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://www.agmrc.org/media/cms/onions_1B4338199EE95.jpg",
                                    fit: BoxFit.cover,
                                    width: 130,
                                    height: 156,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Onion",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 6),
                                      decoration: const BoxDecoration(
                                          color: Color.fromRGBO(0, 170, 91, 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        "In review",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white100,
                                            fontSize: 12),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Assets.iconsIcRouting,
                                          colorFilter: ColorFilter.mode(
                                              AppColors.black50,
                                              BlendMode.srcIn),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          "Ташкент-Москва",
                                          style: TextStyle(
                                              color: AppColors.black50,
                                              fontFamily: "SF-Pro-Display",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Assets.iconsIcSquareDollar,
                                          colorFilter: const ColorFilter.mode(
                                              Color.fromRGBO(240, 113, 20, 1),
                                              BlendMode.srcIn),
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          '\u0024 5200',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  240, 113, 20, 1),
                                              fontFamily: "SF-Pro-Display",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 126,
                                          height: 40,
                                          child: PrimaryButton(
                                              text: "more".tr(),
                                              onPressed: () {}),
                                        ),
                                        const SizedBox(width: 6),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.05),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: AppColors.red,
                                            ))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ]),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

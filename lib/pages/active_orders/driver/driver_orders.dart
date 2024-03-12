import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/pages/active_orders/driver/info_window/info_window.dart';
import 'package:conx/pages/active_orders/driver/search/address_search.dart';
import 'package:conx/pages/active_orders/driver/search/place_services.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../generated/assets.dart';

class DriverOrders extends StatefulWidget {
  const DriverOrders({super.key});

  @override
  State<DriverOrders> createState() => _DriverOrdersState();
}

class _DriverOrdersState extends State<DriverOrders>
    with AutomaticKeepAliveClientMixin {
  final _textFieldController = TextEditingController();
  double lat = 0.0;
  double lng = 0.0;

  final Completer<GoogleMapController> _controller = Completer();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  var initilaPos = LatLng(41.28173821015948, 69.2168272435665);

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
        .onError((error, stackTrace) {});

    return await Geolocator.getCurrentPosition();
  }

  packData() {
    getUserPosition().then((value) async {
      myMarker.add(Marker(
          markerId: const MarkerId("joylashuvim"),
          position: LatLng(value.latitude, value.longitude),
          infoWindow:const InfoWindow(title: "joylashuvim")));
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
      body: Stack(
        children: [
          const BackgroundWidget(),
          Column(
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: AppColors.transparent,
                title: Text("KARTA",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: AppColors.white100)),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 1, 25, 5),
                    child: Center(
                        child: Icon(
                      Icons.add_alert_rounded,
                      color: AppColors.white100,
                    )),
                  )
                ],
              ),
              Expanded(
                child: Stack(children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage(Assets.imagesRoad3),
                                fit: BoxFit.cover)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextFormField(
                                controller: _textFieldController,
                                readOnly: true,
                                onTap: () async {
                                  final sessionToken = const Uuid().v4();
                                  final Suggestion? result = await showSearch(
                                    context: context,
                                    delegate: AddressSearch(sessionToken),
                                  );
                                  final placeDetails = await PlaceApiProvider(
                                          sessionToken)
                                      .getLocationFromPlaceId(result!.placeId);
                                  setState(() {
                                    _textFieldController.text =
                                        result.description;
                                    initilaPos = LatLng(placeDetails.latitude,
                                        placeDetails.longitude);
                                  });
                                },
                                decoration: InputDecoration(
                                    hintText: "enter_address".tr(),
                                    hintStyle: TextStyle(
                                        color: AppColors.white100,
                                        fontFamily: "Inter",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                    prefixIcon: Icon(
                                      CupertinoIcons.search,
                                      color: AppColors.white100,
                                    ),
                                    border: InputBorder.none),
                                cursorColor: AppColors.white100,
                                style: TextStyle(
                                    color: AppColors.white100,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Inter",
                                    fontSize: 16),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SvgPicture.asset(
                              Assets.imagesLinear,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 12)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Stack(children: [
                          GoogleMap(
                            initialCameraPosition:
                                CameraPosition(target: initilaPos, zoom: 14),
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
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(81, 98, 91, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.iconsIcOrders,
                                    height: 24,
                                    width: 24,
                                    color: AppColors.white100,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    (isAllOrdersShowed)
                                        ? "Hide orders"
                                        : "Показать список",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Inter",
                                        color: AppColors.white100,
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
                            height: 150,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(Assets.imagesRoad4),
                                          fit: BoxFit.fill),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "https://www.agmrc.org/media/cms/onions_1B4338199EE95.jpg",
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                const Center(child: CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            width: 130,
                                            height: 156,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Onion",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.white100),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Assets.iconsIcSquareDollar,
                                                  colorFilter: ColorFilter.mode(
                                                    AppColors
                                                        .newOrangeColorForIcon,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '\u0024 5200',
                                                  style: TextStyle(
                                                      color: AppColors.white100,
                                                      fontFamily:
                                                          "SF-Pro-Display",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Assets.iconsIcRouting,
                                                  colorFilter: ColorFilter.mode(
                                                      AppColors
                                                          .newOrangeColorForIcon,
                                                      BlendMode.srcIn),
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "Ташкент-Москва",
                                                  style: TextStyle(
                                                      color: AppColors.white100,
                                                      fontFamily:
                                                          "SF-Pro-Display",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_month,
                                                  color: AppColors
                                                      .newOrangeColorForIcon,
                                                  size: 16,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "12-03-24-16-03-24",
                                                  style: TextStyle(
                                                      color: AppColors.white100,
                                                      fontFamily:
                                                          "SF-Pro-Display",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            Text(
                                              "Подробнее",
                                              style: TextStyle(
                                                  color: AppColors.white100,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
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
            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

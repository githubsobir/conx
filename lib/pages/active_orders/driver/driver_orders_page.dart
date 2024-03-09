import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/pages/active_orders/driver/search/address_search.dart';
import 'package:conx/pages/active_orders/driver/search/place_services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../generated/assets.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/background_widget.dart';

class DriverOrdersPage extends StatefulWidget {
  const DriverOrdersPage({super.key});

  @override
  State<DriverOrdersPage> createState() => _DriverOrdersPageState();
}

class _DriverOrdersPageState extends State<DriverOrdersPage>
    with AutomaticKeepAliveClientMixin {
  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};

  final LatLng _initialLocation = const LatLng(
      41.3089943, 69.2742636); //todo change this with user current location

  final _textFieldController = TextEditingController();

  var isAllOrdersShowed = false;

  @override
  void initState() {
    super.initState();
    // _getLocation();
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
                                  final placeLocation = await PlaceApiProvider(
                                          sessionToken)
                                      .getLocationFromPlaceId(result!.placeId);
                                  setState(() {
                                    _textFieldController.text =
                                        result.description;
                                    moveCamera(placeLocation.latitude,
                                        placeLocation.longitude);
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
                              onMapCreated: _onMapCreated,
                              initialCameraPosition: CameraPosition(
                                  target: _initialLocation, zoom: 14.0),
                              mapType: MapType.normal,
                              myLocationEnabled: true,
                              myLocationButtonEnabled: true,
                              onCameraIdle: onCameraIdle),
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
                                        ? "hide_orders".tr()
                                        : "show_orders".tr(),
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
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
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

  /* Future<void> _getLocation() async {
    Location location = Location();

    LocationData locationData;
    bool serviceEnabled;
    PermissionStatus permissionStatus;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    setState(() {
      print("set state");
      // _initialLocation =
      //     LatLng(locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);
    });
  }*/

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller.complete(controller);
    });
  }

  void moveCamera(double lat, double lng) {
    _controller.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat, lng),
            zoom: 14.0,
          ),
        ),
      );
    });
    //todo send request to api to get orders
  }

  Future<void> onCameraIdle() async {
    print("camera stopped");
    // todo send request to api to get orders
  }

  @override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

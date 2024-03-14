import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/pages/active_orders/driver/driver_orders_controller.dart';
import 'package:conx/pages/active_orders/driver/search/address_search.dart';
import 'package:conx/pages/active_orders/driver/search/place_services.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../generated/assets.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/background_widget.dart';
import 'info_window/info_window.dart';
import 'model/order_data.dart';

class DriverOrdersPage extends ConsumerStatefulWidget {
  const DriverOrdersPage({super.key});

  @override
  ConsumerState<DriverOrdersPage> createState() => _DriverOrdersPageState();
}

class _DriverOrdersPageState extends ConsumerState<DriverOrdersPage>
    with AutomaticKeepAliveClientMixin {
  final Completer<GoogleMapController> _controller = Completer();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  Set<Marker> markers = {};
  List<OrderData> orders = [];

  LatLng _lastSelectedLocation = const LatLng(
      41.3089943, 69.2742636); //todo change this with user current location

  final _textFieldController = TextEditingController();

  var isAllOrdersShowed = false;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final response = ref.watch(getDriverOrders(_lastSelectedLocation));
    return Scaffold(
        body: response.when(data: (data) {
      loadData(data);
      if (response.hasValue) {
        return Stack(
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
                                    final placeLocation =
                                        await PlaceApiProvider(sessionToken)
                                            .getLocationFromPlaceId(
                                                result!.placeId);
                                    setState(() {
                                      _textFieldController.text =
                                          result.description;
                                      _moveCamera(placeLocation.latitude,
                                          placeLocation.longitude);

                                      var response = ref.watch(
                                          getDriverOrders(placeLocation));
                                      loadData(response.hasValue
                                          ? response.value!
                                          : List.empty());
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
                                  target: _lastSelectedLocation, zoom: 14.0),
                              markers: markers,
                              mapType: MapType.normal,
                              myLocationEnabled: true,
                              myLocationButtonEnabled: true,
                              onCameraIdle: _onCameraIdle,
                              onTap: (argument) {
                                _customInfoWindowController.hideInfoWindow!();
                              },
                              onCameraMove: (position) {
                                _customInfoWindowController.onCameraMove!();
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
                                  itemCount: orders.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage(Assets.imagesRoad4),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
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
                                              imageUrl: orders[index]
                                                  .file1
                                                  .toString(),
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
                                                orders[index].name,
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
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                      AppColors
                                                          .newOrangeColorForIcon,
                                                      BlendMode.srcIn,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    '\u0024 ${orders[index].price}',
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.white100,
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
                                                    "${orders[index].locationFrom}-${orders[index].locationTo}",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.white100,
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
                                                    orders[index].date,
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.white100,
                                                        fontFamily:
                                                            "SF-Pro-Display",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              GestureDetector(
                                                onTap: () {
                                                  // todo open full information page
                                                },
                                                child: Text(
                                                  "more".tr(),
                                                  style: TextStyle(
                                                      color: AppColors.white100,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
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
        );
      } else {
        return const CircularProgressIndicator();
      }
    }, error: (error, errorText) {
      return Container();
    }, loading: () {
      return Container();
    }));
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller.complete(controller);
    });
  }

  void _moveCamera(double lat, double lng) {
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
  }

  Future<void> _onCameraIdle() async {
    print("camera idle");
    GoogleMapController controller = await _controller.future;
    LatLngBounds bounds = await controller.getVisibleRegion();
    LatLng center = _calculateCenter(bounds);

    var response = ref.watch(getDriverOrders(center));
    loadData(response.hasValue ? response.value! : List.empty());
  }

  LatLng _calculateCenter(LatLngBounds bounds) {
    double lat = (bounds.southwest.latitude + bounds.northeast.latitude) / 2;
    double lng = (bounds.southwest.longitude + bounds.northeast.longitude) / 2;
    return LatLng(lat, lng);
  }

  _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Geolocator.getCurrentPosition().then((value) =>
        _lastSelectedLocation = LatLng(value.latitude, value.longitude));

    _moveCamera(
        _lastSelectedLocation.latitude, _lastSelectedLocation.longitude);

    var response = ref.watch(getDriverOrders(_lastSelectedLocation));
    loadData(response.value ?? List.empty());
  }

  void loadData(List<OrderData> orders) {
    for (var element in orders) {
      markers.add(
        Marker(
            markerId: MarkerId(element.id.toString()),
            position: LatLng(double.parse(element.latitude),
                double.parse(element.longitude)),
            infoWindow: InfoWindow(title: element.name),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                CustomInfoWindows(id: element.id, orderData: element),
                LatLng(double.parse(element.latitude),
                    double.parse(element.longitude)),
              );
            }),
      );
    }
    this.orders = orders;
    setState(() {});
  }

  @override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

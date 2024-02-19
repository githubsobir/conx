import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/scefics/drivers/cargo_transport/controller_body_type/controller_body_types.dart';
import 'package:conx/scefics/drivers/cargo_transport/manufacturer.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BodyType extends ConsumerStatefulWidget {
  String bodyType;

  BodyType({super.key, required this.bodyType});

  @override
  ConsumerState<BodyType> createState() => _BodyTypeState();
}

class _BodyTypeState extends ConsumerState<BodyType> {

var box = HiveBoxes();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ref.watch(controllerCarBodyType).boolGetData
          ? SafeArea(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.bodyType,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 54,
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                        child: ListView.builder(
                            itemCount: ref
                                .watch(controllerCarBodyType.notifier)
                                .listModelControllerBodyType
                                .length,
                            itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {

                                    box.modelTransport = ref
                                        .watch(controllerCarBodyType.notifier)
                                        .listModelControllerBodyType[index].id.toString();
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => Manufacturer(),
                                        ));
                                  },
                                  child: Card(
                                      color: Colors.grey.shade50,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            onTap: () {},
                                            title: Text(ref
                                                .watch(controllerCarBodyType
                                                    .notifier)
                                                .listModelControllerBodyType[
                                                    index]
                                                .name),
                                            trailing: const Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                            height: 120,
                                            child: CachedNetworkImage(
                                                imageUrl: ref
                                                    .watch(controllerCarBodyType
                                                        .notifier)
                                                    .listModelControllerBodyType[
                                                        index]
                                                    .image,
                                                imageBuilder: (context,
                                                        imageProvider) =>
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image:
                                                                imageProvider,
                                                            fit: BoxFit.cover,
                                                            colorFilter:
                                                                const ColorFilter.mode(
                                                                    Colors.red,
                                                                    BlendMode
                                                                        .colorBurn)),
                                                      ),
                                                    ),
                                                placeholder: (context, url) =>
                                                    const CupertinoActivityIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                       const Image(
                                                          image: AssetImage(
                                                            "assets/images/track_car.png",
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ) // Icon(Icons.error),
                                                ),
                                          )
                                        ],
                                      )),
                                )))
                  ],
                ),
              ),
            )
          : Center(child: CupertinoActivityIndicator()),
    );
  }
}

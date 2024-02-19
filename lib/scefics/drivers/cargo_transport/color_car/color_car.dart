import 'package:conx/scefics/drivers/cargo_transport/car_date/car_date.dart';
import 'package:conx/scefics/drivers/cargo_transport/car_models/controller_car_model.dart';
import 'package:conx/scefics/drivers/cargo_transport/color_car/controller_car%20_color.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarColor extends ConsumerStatefulWidget {
  const CarColor({super.key});

  @override
  ConsumerState<CarColor> createState() => _CarColorState();
}

class _CarColorState extends ConsumerState<CarColor> {

  var box = HiveBoxes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (ref.watch(controllerCarColor).boolGetData) {
      return ref.watch(controllerCarModel).errorMessage.length > 10
          ? Center(
              child: Text(ref.watch(controllerCarModel).errorMessage),
            )
          : SafeArea(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Какого цвета ваша машина?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
                                .watch(controllerCarColor.notifier)
                                .listModelCarColor
                                .length,
                            itemBuilder: (context, index) => Card(
                                color: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      onTap: () {

                                        box.modelCarColor = ref
                                            .watch(controllerCarColor.notifier)
                                            .listModelCarColor[index]
                                            .id.toString();
                                        Navigator.push(context, CupertinoPageRoute(builder: (context) => CarDateYear(),));

                                      },

                                      title: Text(ref
                                          .watch(controllerCarColor.notifier)
                                          .listModelCarColor[index]
                                          .name),
                                      // subtitle: Text(ref.watch(controllerCarModel.notifier).listCarModel[index].description),
                                      trailing:const Icon(Icons.arrow_forward_ios,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ))))
                  ],
                ),
              ),
            );
    } else {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
  }
}

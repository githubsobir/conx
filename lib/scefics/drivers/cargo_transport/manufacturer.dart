import 'package:conx/scefics/drivers/cargo_transport/car_model.dart';
import 'package:conx/scefics/drivers/cargo_transport/controller_manufactory/controller_manufactory.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Manufacturer extends ConsumerStatefulWidget {
  const Manufacturer({super.key});

  @override
  ConsumerState<Manufacturer> createState() => _ManufacturerState();
}

class _ManufacturerState extends ConsumerState<Manufacturer> {

  var box = HiveBoxes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: buildBody());
  }

  Widget buildBody() {
    if (ref.watch(controllerManufacturers).boolGetData) {
      if (ref.watch(controllerManufacturers).errorMessage.length < 20) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Кто производител?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
                            .watch(controllerManufacturers.notifier)
                            .listManufacturers
                            .length,
                        itemBuilder: (context, index) => Card(
                            color: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {

                                    box.modelManufacturer = ref
                                        .watch(controllerManufacturers.notifier)
                                        .listManufacturers[index]
                                        .id
                                        .toString();
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => const CarModel(),
                                        ));
                                  },
                                  title: Text(ref
                                      .watch(controllerManufacturers.notifier)
                                      .listManufacturers[index]
                                      .name
                                      .toString()),
                                  trailing: const Icon(Icons.arrow_forward_ios,
                                      color: Colors.grey),
                                ),
                              ],
                            ))))
              ],
            ),
          ),
        );
      } else {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(ref.watch(controllerManufacturers).errorMessage.toString())
              ],
            ),
          ),
        );
      }
    } else {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
  }
}

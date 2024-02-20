import 'package:conx/scefics/drivers/cargo_transport/body_type.dart';
import 'package:conx/scefics/drivers/cargo_transport/controler_weigth/controller_weigth.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CargoTransport extends ConsumerStatefulWidget {
  const CargoTransport({super.key});

  @override
  ConsumerState<CargoTransport> createState() => _CargoTransportState();
}

class _CargoTransportState extends ConsumerState<CargoTransport> {

  var box = HiveBoxes() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      ref.watch(controllerCarWeigthServer).boolGetData ?
      SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Грузовые транспорты по полной массе",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: ref.watch(controllerCarWeigthServer.notifier).listModelWeigth.length,
                      itemBuilder: (context, index) =>

                          Card(
                          color: Colors.grey.shade100,
                          child: ListTile(
                            onTap: () {
                              box.transportType = ref.watch(controllerCarWeigthServer.notifier).listModelWeigth[index].id.toString();
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => BodyType(bodyType:ref.watch(controllerCarWeigthServer.notifier).listModelWeigth[index].name ),));
                            },
                            title: Text(ref.watch(controllerCarWeigthServer.notifier).listModelWeigth[index].name.toString()),
                            subtitle: Text(
                                ref.watch(controllerCarWeigthServer.notifier).listModelWeigth[index].description.toString()),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ))))
            ],
          ),
        ),
      )
      :const Center(child: CupertinoActivityIndicator())
      ,
    );
  }
}

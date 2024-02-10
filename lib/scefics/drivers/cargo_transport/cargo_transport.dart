import 'package:conx/scefics/drivers/cargo_transport/body_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CargoTransport extends StatefulWidget {
  const CargoTransport({super.key});

  @override
  State<CargoTransport> createState() => _CargoTransportState();
}

class _CargoTransportState extends State<CargoTransport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [

              Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) =>
                          index == 0?
                         const Text(
                            "Грузовые транспорты по полной массе",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                          )
                              :
                          Card(
                          color: Colors.grey.shade100,
                          child: ListTile(
                            onTap: () {

                              Navigator.push(context, CupertinoPageRoute(builder: (context) => BodyType(),));
                            },
                            title: Text("До 1,2 т"),
                            subtitle: Text(
                                "Небольшие фургоны и микроавтобусы, используемые в формате местной, региональной доставки."),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ))))
            ],
          ),
        ),
      ),
    );
  }
}

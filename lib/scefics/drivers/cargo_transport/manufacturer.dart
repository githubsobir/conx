import 'package:conx/scefics/drivers/cargo_transport/car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Manufacturer extends StatefulWidget {
  const Manufacturer({super.key});

  @override
  State<Manufacturer> createState() => _ManufacturerState();
}

class _ManufacturerState extends State<Manufacturer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
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
                        borderSide: const BorderSide(color: Colors.transparent),
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
                      itemCount: 8,
                      itemBuilder: (context, index) => Card(
                          color: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => CarModel(),
                                      ));
                                },
                                title: Text("Model 3"),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey),
                              ),
                            ],
                          ))))
            ],
          ),
        ),
      ),
    );
  }
}

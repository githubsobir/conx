import 'package:conx/scefics/drivers/cargo_transport/manufacturer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyType extends StatefulWidget {
  const BodyType({super.key});

  @override
  State<BodyType> createState() => _BodyTypeState();
}

class _BodyTypeState extends State<BodyType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: Container(
          margin:const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text(
                "Тип кузова от 8 до 14 т",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 54,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon:const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:const BorderSide(color: Colors.transparent),
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
                      itemCount: 10,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: (){
                          Navigator.push(context,CupertinoPageRoute(builder: (context) => Manufacturer(),));
                        },
                        child: Card(
                            color: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {},
                                  title: Text("Автовозы"),
                                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 120,
                                  child: Image.asset("assets/images/track_car.png"),
                                )
                              ],
                            )),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

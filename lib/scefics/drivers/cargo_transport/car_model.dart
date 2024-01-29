import 'package:flutter/material.dart';

class CarModel extends StatefulWidget {
  const CarModel({super.key});

  @override
  State<CarModel> createState() => _CarModelState();
}

class _CarModelState extends State<CarModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          margin:const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Какая у вас модель?",
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
                      itemCount: 8,
                      itemBuilder: (context, index) => Card(
                          color: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {},
                                title: Text("Volvo"),
                                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
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

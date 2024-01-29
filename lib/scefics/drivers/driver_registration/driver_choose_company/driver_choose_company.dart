import 'package:flutter/material.dart';

class DriverChooseCompany extends StatefulWidget {
  const DriverChooseCompany({super.key});

  @override
  State<DriverChooseCompany> createState() => _DriverChooseCompanyState();
}

class _DriverChooseCompanyState extends State<DriverChooseCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Выбирите свою компанию",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.transparent),
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
              const SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) =>
                    index == 0?Card(
                      color: Colors.grey.shade200,
                        child:ListTile(

                          title: Text("Не указать"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )
                    ):
                    Card(
                        color: Colors.grey.shade100,
                  child:ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text("Efficient logistics solutions"),
                    subtitle: Text("Logistics service in Tashkent"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )
                )
              ))
            ],
          ),
        ),
      ),
    );
  }
}

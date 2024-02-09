import 'package:conx/scefics/drivers/choose_rate/choose_rate.dart';
import 'package:flutter/cupertino.dart';
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
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
             const Text(
                "Выбирите свою компанию",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon:const Icon(Icons.search),
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
                        child: ListTile(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          title: Text("Не указать"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )
                    ):
                    Card(
                        color: Colors.grey.shade100,
                  child:ListTile(
                    onTap: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => ChooseRate(),));
                    },
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

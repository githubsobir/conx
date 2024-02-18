import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddRow1 extends ConsumerStatefulWidget {
  const AddRow1({super.key});

  @override
  ConsumerState<AddRow1> createState() => _AddRow1State();
}

class _AddRow1State extends ConsumerState<AddRow1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Выберите свое направление", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold ),),
                const SizedBox(height: 20),
                Text("Город"),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    onTap: (){},
                    title: Text(""),
                    trailing: Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.import_export, size: 30),
                  ],
                ),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    onTap: (){},
                    title: Text(""),
                    trailing: Icon(Icons.keyboard_arrow_down),
                  ),
                )

              ],
            ),
      )),
    );
  }
}

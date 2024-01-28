import 'package:conx/scefics/drivers/passport/passport.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerRegistration extends StatefulWidget {
  const DrawerRegistration({super.key});

  @override
  State<DrawerRegistration> createState() => _DrawerRegistrationState();
}

class _DrawerRegistrationState extends State<DrawerRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: AppColors.colorBackground),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  title: Text("Онлайн регистрация",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                  subtitle: Text("Для регистрации нам нужны эти данные",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              margin:const EdgeInsets.all(20),
              child: Column(
                children: [
                 const Row(
                    children: [
                      Icon(
                        Icons.account_box_outlined,
                        color: AppColors.colorBackground,
                      ),
                       SizedBox(width: 10),
                      Text(
                        "Удостоверение личности",
                        style: TextStyle(color: AppColors.colorBackground),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: ListView.builder(
                      physics:const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const  Card(
                          color: Color.fromRGBO(241, 242, 240, 1),
                          child: ListTile(
                            title: Text("Паспорт или ID карта"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Row(
                    children: [
                      Icon(
                        Icons.local_shipping_outlined,
                        color: AppColors.colorBackground,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Данные о транспорте",
                        style: TextStyle(color: AppColors.colorBackground),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: ListView.builder(
                      physics:const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const  Card(
                          color: Color.fromRGBO(241, 242, 240, 1),
                          child: ListTile(
                            title: Text("Паспорт или ID карта"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () async {

                      Navigator.push(context, CupertinoPageRoute(builder: (context) => const Passport(),));
                    },
                    height: 50,
                    minWidth: double.infinity,
                    color: AppColors.colorBackground,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                    child: const Text("Tekshiruv uchun yuborish",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
        
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

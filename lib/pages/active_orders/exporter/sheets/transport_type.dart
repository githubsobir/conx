import 'package:conx/pages/active_orders/exporter/controller_exporter.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


getBottomSheetTransportType({required BuildContext context}) {
  showModalBottomSheet(
      context: context,
      barrierColor: AppColors.white50,
      builder: (BuildContext context) {
        return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            height: MediaQuery.of(context).size.height * 0.6,
            child: TransportTypeBottomSheet());
      });
}


class TransportTypeBottomSheet extends ConsumerStatefulWidget {
  const TransportTypeBottomSheet({super.key});

  @override
  ConsumerState<TransportTypeBottomSheet> createState() =>
      _TransportTypeBottomSheetState();
}

class _TransportTypeBottomSheetState extends ConsumerState<TransportTypeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // ref.read(controllerExporter.notifier).getTransportType();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/road2.png"),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ref.read(controllerExporter.notifier).listTransportType.length,
              itemBuilder: (context, index) => ListTile(
                onTap: (){

                  ref.read(controllerExporter.notifier).setTransportType(transportTypeId: ref.read(controllerExporter.notifier).listTransportType[index].id.toString(), transportTypeName: ref.read(controllerExporter.notifier).listTransportType[index].name.toString());

                  Navigator.of(context).pop();
                },

                leading: Text(
                  ref.read(controllerExporter.notifier).listTransportType[index].name.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white100,
                      fontSize: 16),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: AppColors.white100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:conx/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Exporter extends StatefulWidget {
  const Exporter({super.key});

  @override
  State<Exporter> createState() => _ExporterState();
}

class _ExporterState extends State<Exporter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white10,
      ),
      body: SafeArea(child: Column(children: [

      ],)),
    );
  }
}

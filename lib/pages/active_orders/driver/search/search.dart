import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesApiGoogleMapSearch extends ConsumerStatefulWidget {
  const PlacesApiGoogleMapSearch({super.key});

  @override
  ConsumerState<PlacesApiGoogleMapSearch> createState() => _SearchInMapState();
}

class _SearchInMapState extends ConsumerState<PlacesApiGoogleMapSearch> {
  final _controller = TextEditingController();
  double lat = 0.0;
  double lng = 0.0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

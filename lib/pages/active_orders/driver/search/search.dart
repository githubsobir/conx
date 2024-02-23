import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class PlacesApiGoogleMapSearch extends ConsumerStatefulWidget {
  const PlacesApiGoogleMapSearch({super.key});

  @override
  ConsumerState<PlacesApiGoogleMapSearch> createState() => _SearchInMapState();
}

class _SearchInMapState extends ConsumerState<PlacesApiGoogleMapSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

import 'dart:convert';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';

class Place {
  double latitude;
  double longitude;

  Place(
    this.latitude,
    this.longitude,
  );

  @override
  String toString() {
    return 'Place(latitude: $latitude, longitude: $longitude)';
  }
}

class Suggestion {
  final String placeId;
  final String description;

  Suggestion(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}

class PlaceApiProvider {
  final _hive = HiveBoxes();

  final _dio = Dio();
  final _client = Client();
  String sessionToken = "";

  PlaceApiProvider(this.sessionToken);

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&language=${_hive.langUser}&key=${MainUrl.googleMapApiKey}';
    final response = await _dio.get(request);
    if (response.statusCode == 200) {
      Map<String, dynamic> result = response.data;
      if (result['status'] == 'OK') {
        var list = result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();
        return list;
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<Place> getLocationFromPlaceId(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=${MainUrl.googleMapApiKey}';

    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      final data = response.data;
      final result = data['result'];
      final geometry = result['geometry'];
      final location = geometry['location'];
      final lat = location['lat'];
      final lng = location['lng'];

      print(lat);
      print(lng);
      return Place(lat, lng);
    } else {
      throw Exception('Failed to load location');
    }
  }
}

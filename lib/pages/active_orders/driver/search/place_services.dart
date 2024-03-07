import 'dart:convert';
import 'package:dio/dio.dart';

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
  final dio = Dio();
  final apiKey = "";
  String sessionToken = "";

  PlaceApiProvider(this.sessionToken);

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&language=$lang&key=$apiKey';
    final response = await dio.get(request);

    print(response);

    if (response.statusCode == 200) {
      final result = json.decode(response.data);
      if (result['status'] == 'OK') {
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();
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
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.data);
      final result = data['result'];
      final geometry = result['geometry'];
      final location = geometry['location'];
      final lat = location['lat'];
      final lng = location['lng'];

      return Place(lat, lng);
    } else {
      throw Exception('Failed to load location');
    }
  }
}

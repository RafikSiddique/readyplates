import 'dart:convert';

import 'package:http/http.dart';

class Place {
  double? lat;
  double? lang;

  Place({this.lang, this.lat});

  @override
  String toString() {
    return 'Place(lat: $lat, long: $lang,)';
  }
}

class Suggestion {
  final String? placeId;
  final String? description;

  Suggestion(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}

class PlaceApiProvider {
  final client = Client();
  PlaceApiProvider(this.sessionToken);

  final sessionToken;

  String googleApiKey = "AIzaSyDR2to-aBls8N4Wqa4xt3Et5vk2GkVF2Do";

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final String request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&language=$lang&components=country:us&key=$googleApiKey&sessiontoken=$sessionToken';

    Uri req = Uri.parse(request);
    final response = await client.get(req);

    if (response.statusCode == 200) {
      Map result = json.decode(response.body);

      if (result['status'] == 'OK') {
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();
      } else if (result['status'] == 'ZERO_RESULTS') {
        return [];
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<Place> getPlaceDetailFromId(String? placeId) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry&key=$googleApiKey&sessiontoken=$sessionToken';
    Uri req = Uri.parse(request);
    final response = await client.get(req);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        final components = result['result']['geometry']['location'] as Map;

        final place = Place();
        place.lat = double.parse(components['lat'].toString());
        place.lang = double.parse(components['lng'].toString());
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}

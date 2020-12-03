import 'dart:convert';

import 'package:http/http.dart' as http;

const GEOAPIFY_API_KEY = '115ff60093c9411f977ef4975a121023';

class LocationHelper {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    return 'https://maps.geoapify.com/v1/staticmap?style=osm-carto&width=600&height=400&center=lonlat:$longitude,$latitude&zoom=14&apiKey=$GEOAPIFY_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        'https://api.geoapify.com/v1/geocode/reverse?lat=$lat&lon=$lng&lang=de&limit=1&apiKey=$GEOAPIFY_API_KEY';
    final response = await http.get(url);
    return json.decode(response.body)["features"][0]["properties"]["formatted"];
  }
}

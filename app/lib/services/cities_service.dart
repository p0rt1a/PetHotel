import 'dart:convert';

import 'package:app/models/city.dart';
import 'package:http/http.dart' as http;

class CitiesService {
  String baseUrl = "https://turkiyeapi.dev/api/v1/provinces";

  Future<List<City>> getCities() async {
    final response = await http.get(Uri.parse(baseUrl));
    List<dynamic> resp = jsonDecode(response.body)["data"];
    List<City> cities = List.empty(growable: true);

    resp.forEach((element) {
      City city = City.fromJson(element);

      cities.add(city);
    });

    return cities;
  }
}

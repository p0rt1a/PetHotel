import 'dart:convert';

import 'package:app/config.dart';
import 'package:app/models/hotel/hotels_view_model.dart';
import 'package:http/http.dart' as http;

class HotelService {
  Future<List<HotelsViewModel>> getHotels(int page) async {
    final response =
        await http.get(Uri.parse("$baseUrl/hotels/getAll?page=$page"));
    List<dynamic> resp = jsonDecode(utf8.decode(response.bodyBytes));
    List<HotelsViewModel> hotels = List.empty(growable: true);

    resp.forEach((element) {
      HotelsViewModel vm = HotelsViewModel.fromJson(element);

      hotels.add(vm);
    });
    return hotels;
  }
}

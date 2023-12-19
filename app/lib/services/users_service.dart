import 'dart:convert';

import 'package:app/config.dart';
import 'package:app/models/pet/pets_view_model.dart';
import 'package:app/models/user/users_view_model.dart';
import 'package:http/http.dart' as http;

class UsersService {
  Future<UsersViewModel> getUserDetails(String id) async {
    final response =
        await http.get(Uri.parse("$baseUrl/users/getUserInfo/$id"));
    dynamic resp = jsonDecode(utf8.decode(response.bodyBytes));
    UsersViewModel vm = UsersViewModel.fromJson(resp);

    return vm;
  }

  Future<List<PetsViewModel>> getUserPets(String id) async {
    final response =
        await http.get(Uri.parse("$baseUrl/users/getUserPets/$id"));
    List<dynamic> resp = jsonDecode(utf8.decode(response.bodyBytes));
    List<PetsViewModel> pets = List.empty(growable: true);

    resp.forEach((element) {
      PetsViewModel vm = PetsViewModel.fromJson(element);

      pets.add(vm);
    });

    return pets;
  }
}

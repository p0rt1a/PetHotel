import 'package:app/models/pet/pets_view_model.dart';

class UsersViewModel {
  late String id;
  late String name;
  String image = "lib/assets/images/man.jpg";
  late List<PetsViewModel> pets;
  late String surname;
  late String email;
  late bool emailConfirmStatus;
  String? phoneNumber;
  late String createdAt;

  UsersViewModel(
      {required this.id,
      required this.name,
      required this.surname,
      required this.email,
      required this.pets,
      required this.emailConfirmStatus,
      required this.createdAt});

  UsersViewModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    surname = json["surname"];
    pets = (json["pets"] as List)
        .map((pet) => PetsViewModel.fromJson(pet))
        .toList();
    email = json["email"];
    phoneNumber = json["phoneNumber"];
    emailConfirmStatus = json["emailConfirmStatus"];
    createdAt = json["createdAt"];
  }
}

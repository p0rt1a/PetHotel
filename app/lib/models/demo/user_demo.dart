import 'package:app/models/demo/pet_demo.dart';

class User {
  String image;
  String name;
  String email;
  String dateOfBirth;
  String phoneNumber;
  bool emailConfirmStatus;
  String createdAt;
  List<Pet> pets;

  User(
      {required this.image,
      required this.name,
      required this.email,
      required this.dateOfBirth,
      required this.phoneNumber,
      required this.emailConfirmStatus,
      required this.createdAt,
      required this.pets});
}

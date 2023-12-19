class PetsViewModel {
  late int id;
  late String name;
  late String brand;
  late String createdAt;

  PetsViewModel(
      {required this.id,
      required this.name,
      required this.brand,
      required this.createdAt});

  PetsViewModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    brand = json["brand"];
    createdAt = json["createdAt"];
  }
}

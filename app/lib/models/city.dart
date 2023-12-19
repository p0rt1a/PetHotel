class City {
  late String name;

  City({required this.name});

  City.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}

class HotelsRoomViewModel {
  late int id;
  final List<String> images = [
    "lib/assets/images/hotel_room.jpg",
    "lib/assets/images/hotel_room.jpg"
  ];
  late String title;
  late String description;
  late String brand;
  late double price;

  HotelsRoomViewModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.brand,
      required this.price});

  HotelsRoomViewModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    brand = json["brand"];
    price = json["price"];
  }
}

class HotelRoom {
  final List<String> images = [
    "lib/assets/images/hotel_room.jpg",
    "lib/assets/images/hotel_room.jpg"
  ];
  final String price;
  final String description;
  final List<String> brands;

  HotelRoom(
      {required this.price, 
      required this.description, 
      required this.brands});
}

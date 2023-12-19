import 'package:app/models/demo/comment_demo.dart';
import 'package:app/models/hotel_room/hotels_room_view_model.dart';

class HotelsViewModel {
  late int id;
  late String name;
  late List<String> brands;
  late String city;
  late String district;
  late String description;
  late String email;
  late String phone;
  late double rate;
  late int rateCount;
  late List<HotelsRoomViewModel> rooms;
  List<String> images = [
    "lib/assets/images/hotel.jpeg",
    "lib/assets/images/hotel_1.jpg"
  ];
  List<Comment> comments = [
    Comment(
        ownerImage: "lib/assets/images/man.jpg",
        owner: "Alp Polat",
        date: "12.02.2023",
        body:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        rate: 3),
    Comment(
        ownerImage: "lib/assets/images/women.jpg",
        owner: "Gülsüm Şener",
        date: "27.04.2023",
        body:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        rate: 4),
    Comment(
        ownerImage: "lib/assets/images/man.jpg",
        owner: "Kazım Uysal",
        date: "12.02.2023",
        body:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        rate: 2),
    Comment(
        ownerImage: "lib/assets/images/women.jpg",
        owner: "User29324",
        date: "31.12.2022",
        body:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        rate: 5)
  ];

  HotelsViewModel(
      {required this.id,
      required this.name,
      required this.brands,
      required this.city,
      required this.district,
      required this.description,
      required this.rooms,
      required this.email,
      required this.phone,
      required this.rate,
      required this.rateCount});

  HotelsViewModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    brands = List<String>.from(json["brands"] as List<dynamic>);
    rooms = (json["rooms"] as List)
        .map((room) => HotelsRoomViewModel.fromJson(room))
        .toList();
    city = json["city"];
    district = json["district"];
    description = json["description"];
    email = json["email"];
    phone = json["phoneNumber"];
    rate = json["rate"];
    rateCount = json["rateCount"];
  }
}

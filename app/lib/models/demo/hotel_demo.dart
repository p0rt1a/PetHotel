import 'package:app/models/demo/comment_demo.dart';
import 'package:app/models/demo/hotel_room_demo.dart';

class Hotel {
  final String name;
  final String city;
  final String district;
  final double rate;
  final int rateCount;
  final String email;
  final String phone;
  final List<String> brands;
  final String description;
  final List<HotelRoom> rooms = [
    HotelRoom(
        price: "300",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        brands: ["Köpek"]),
    HotelRoom(
        price: "300",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        brands: ["Kedi"]),
    HotelRoom(
        price: "300",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        brands: ["Köpek", "Kedi"]),
    HotelRoom(
        price: "300",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        brands: ["Köpek", "Kedi"])
  ];
  final List<String> images = [
    "lib/assets/images/hotel.jpeg",
    "lib/assets/images/hotel_1.jpg"
  ];
  final List<Comment> comments;

  Hotel({
    required this.rateCount,
    required this.name,
    required this.city,
    required this.district,
    required this.rate,
    required this.comments,
    required this.phone,
    required this.email,
    required this.brands,
    required this.description,
  });
}

import 'package:app/components/badge.dart';
import 'package:app/components/comment_view.dart';
import 'package:app/components/hotel_room_view.dart';
import 'package:app/constants/palette.dart';
import 'package:app/models/demo/comment_demo.dart';
import 'package:app/models/hotel/hotels_view_model.dart';
import 'package:app/models/hotel_room/hotels_room_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key, required this.hotel});
  final HotelsViewModel hotel;

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text(
                  widget.hotel.name,
                ),
                MyCustomBadge(
                    icon: Icons.star,
                    iconColor: Colors.yellow,
                    text: "${widget.hotel.rate} (${widget.hotel.rateCount})",
                    outlined: false,
                    color: Colors.red.shade500,
                    borderColor: Colors.white)
              ],
            ),
            bottom: TabBar(tabs: [
              const Tab(text: "Otel Bilgileri"),
              const Tab(text: "Rezervasyon"),
              Tab(text: "Yorumlar (${widget.hotel.comments.length})")
            ]),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TabBarView(children: [
                    HotelInformation(hotel: widget.hotel),
                    Reservation(rooms: widget.hotel.rooms),
                    Comments(comments: widget.hotel.comments)
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}

class HotelInformation extends StatefulWidget {
  const HotelInformation({super.key, required this.hotel});
  final HotelsViewModel hotel;

  @override
  State<HotelInformation> createState() => _HotelInformationState();
}

class _HotelInformationState extends State<HotelInformation> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider.builder(
            itemCount: widget.hotel.images.length,
            itemBuilder: (BuildContext context, int itemIndex,
                    int pageViewIndex) =>
                Container(
                  width: deviceWidth,
                  height: deviceHeight / 3.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.hotel.images[itemIndex]))),
                ),
            options: CarouselOptions(
                height: deviceHeight / 3.4,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                enlargeStrategy: CenterPageEnlargeStrategy.height)),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.green,
                        size: 26,
                        shadows: [
                          Shadow(
                              offset: const Offset(-1.5, 1.5),
                              color: HexColor(dark),
                              blurRadius: 8)
                        ],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.hotel.phone,
                        style: TextStyle(fontSize: 16, color: HexColor(dark)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: HexColor(primary),
                        size: 26,
                        shadows: [
                          Shadow(
                              offset: const Offset(-1.5, 1.5),
                              color: HexColor(dark),
                              blurRadius: 8)
                        ],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.hotel.email,
                        style: TextStyle(fontSize: 16, color: HexColor(dark)),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          color: Colors.red,
                          size: 30,
                          shadows: [
                            Shadow(
                                color: HexColor(dark),
                                offset: const Offset(-1.5, 1.5),
                                blurRadius: 8)
                          ]),
                      const SizedBox(width: 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.hotel.district}, ${widget.hotel.city}",
                            style:
                                TextStyle(color: HexColor(dark), fontSize: 15),
                          ),
                          Text(
                            "XXX Cad. YYY Mah.",
                            style:
                                TextStyle(color: HexColor(dark), fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: HexColor(primary),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.map,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Haritada Göster",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  widget.hotel.description,
                  style: TextStyle(color: HexColor(dark), fontSize: 16),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class Reservation extends StatefulWidget {
  const Reservation({super.key, required this.rooms});
  final List<HotelsRoomViewModel> rooms;

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    return widget.rooms.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: widget.rooms.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: HotelRoomView(room: widget.rooms[index]),
                  );
                }),
          )
        : const Center(
            child: Text(
              "Kayıtlı oda bulunamadı!",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          );
  }
}

class Comments extends StatefulWidget {
  const Comments({super.key, required this.comments});
  final List<Comment> comments;

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          itemCount: widget.comments.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(top: 4),
                child: CommentView(comment: widget.comments[index]));
          }),
    );
  }
}

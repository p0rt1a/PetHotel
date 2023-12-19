import 'package:app/components/badge.dart';
import 'package:app/constants/palette.dart';
import 'package:app/models/hotel/hotels_view_model.dart';
import 'package:app/pages/hotel_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HotelView extends StatefulWidget {
  const HotelView({super.key, required this.hotel});
  final HotelsViewModel hotel;

  @override
  State<HotelView> createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HotelDetailScreen(hotel: widget.hotel)));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 160,
                    width: deviceWidth,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6)),
                      image: DecorationImage(
                          image: AssetImage(widget.hotel.images[0]),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 160,
                    width: deviceWidth,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6)),
                    ),
                  ),
                  Positioned(
                      left: 20,
                      bottom: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyCustomBadge(
                              icon: Icons.star,
                              iconColor: Colors.yellow,
                              text:
                                  "${widget.hotel.rate.toString()} (${widget.hotel.rateCount.toString()})",
                              outlined: false,
                              color: Colors.red.shade500,
                              borderColor: Colors.white),
                          Row(
                            children: [
                              Text(
                                widget.hotel.name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 24,
                              shadows: [
                                Shadow(
                                    color: HexColor(dark),
                                    offset: const Offset(-1.5, 1.5),
                                    blurRadius: 8)
                              ],
                            ),
                            Text(
                                "${widget.hotel.district}, ${widget.hotel.city}",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: HexColor(dark),
                                    fontWeight: FontWeight.w500,
                                    shadows: [
                                      Shadow(
                                          color: HexColor(dark),
                                          offset: const Offset(-1, 3),
                                          blurRadius: 20)
                                    ]))
                          ],
                        ),
                        Row(
                          children: [
                            for (String brand in widget.hotel.brands)
                              Card(
                                  elevation: 5,
                                  color: brand == "Köpek"
                                      ? HexColor(primary)
                                      : HexColor(fancy),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Text(brand,
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white)),
                                  ))
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        widget.hotel.description,
                        style: TextStyle(color: HexColor(dark), fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: HexColor(dark), width: 0.5))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 4, 6, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                elevation: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: HexColor(primary),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 6),
                                    child: Text(
                                      "İncele",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.people_alt,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    "${widget.hotel.comments.length} yorum",
                                    style: const TextStyle(fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

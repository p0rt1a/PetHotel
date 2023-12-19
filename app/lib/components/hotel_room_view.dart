import 'package:app/components/badge.dart';
import 'package:app/constants/palette.dart';
import 'package:app/models/hotel_room/hotels_room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HotelRoomView extends StatefulWidget {
  const HotelRoomView({super.key, required this.room});
  final HotelsRoomViewModel room;

  @override
  State<HotelRoomView> createState() => _HotelRoomViewState();
}

class _HotelRoomViewState extends State<HotelRoomView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.room.title,
                  style: const TextStyle(fontSize: 18),
                ),
                MyCustomBadge(
                    text: widget.room.brand,
                    size: "xs",
                    outlined: true,
                    color: Colors.white,
                    borderColor: widget.room.brand == "Köpek"
                        ? HexColor(primary)
                        : HexColor(fancy)),
              ],
            ),
            const SizedBox(height: 6),
            // body
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 160,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(widget.room.images[0]),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.room.description,
                        style: TextStyle(color: HexColor(dark), fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 6),
            // footer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(elevation: 3),
                    child: Text(
                      "${widget.room.price}₺ / gece",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black),
                    )),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 3, backgroundColor: Colors.orangeAccent),
                    child: const Text(
                      "Rezervasyon Yap",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

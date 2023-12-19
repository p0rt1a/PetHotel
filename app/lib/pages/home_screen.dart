import 'package:app/components/hotel_view.dart';
import 'package:app/models/hotel/hotels_view_model.dart';
import 'package:app/services/hotels_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HotelService hotelService = HotelService();
  TextEditingController searchController = TextEditingController();
  //TODO: Handle page statement

  @override
  Widget build(BuildContext context) {
    hotelService.getHotels(0);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          actions: [
            OutlinedButton(onPressed: () {}, child: const Text("Köpek")),
            const SizedBox(width: 4),
            OutlinedButton(onPressed: () {}, child: const Text("İstanbul")),
            const SizedBox(width: 4),
            OutlinedButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text("4.5")
                  ],
                ))
          ],
        ),
        FutureBuilder(
            future: hotelService.getHotels(0),
            builder: (BuildContext context,
                AsyncSnapshot<List<HotelsViewModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text("An error occured: ${snapshot.error}"),
                  ),
                );
              } else {
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            HotelView(hotel: snapshot.data![index]),
                        childCount: snapshot.data!.length));
              }
            })
      ],
    );
  }
}

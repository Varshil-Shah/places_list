import 'package:flutter/material.dart';
import 'package:places_list/providers/great_places.dart';
import 'package:places_list/screens/add_place.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlace.routeName);
            },
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: const Center(
          child: Text("Got no places yet, start adding some!!"),
        ),
        builder: (ctx, greatPlace, child) => greatPlace.items.isEmpty
            ? child as Widget
            : ListView.builder(
                itemBuilder: (ctxx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatPlace.items[i].image),
                  ),
                  title: Text(greatPlace.items[i].title),
                  onTap: () {
                    // ... go to detail page
                  },
                ),
                itemCount: greatPlace.items.length,
              ),
      ),
    );
  }
}

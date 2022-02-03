import "package:flutter/material.dart";
import 'package:places_list/screens/add_place.dart';
import 'package:provider/provider.dart';

import 'package:places_list/screens/places_list.dart';
import 'package:places_list/providers/great_places.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Great Places",
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const PlacesList(),
        routes: {
          AddPlace.routeName: (ctx) => const AddPlace(),
        },
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:places_list/helper/db_helper.dart';
import 'package:places_list/models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: PlaceLocation(
        latitude: 19.0760,
        longitude: 72.8777,
      ),
      image: image,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert("places", {
      "id": newPlace.id,
      "title": newPlace.title,
      "image": newPlace.image.path,
    });
  }
}

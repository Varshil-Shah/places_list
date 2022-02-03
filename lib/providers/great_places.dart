import 'package:flutter/foundation.dart';
import 'package:places_list/models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}

import 'package:flutter/material.dart';
import 'package:fullvpn/Models/locationModel.dart';

class locationsProvider extends ChangeNotifier {
  List<Location> locations = [
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "New York"),
    Location(
        flag: "assets/images/usa.png", country: "United States", city: "Texas"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "Hennssy"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "Rochester"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "Manhattan"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "Hennssy"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "Hennssy"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "New York"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "New York"),
    Location(
        flag: "assets/images/usa.png", country: "United States", city: "Texas"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "Hennssy"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "Rochester"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "Manhattan"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "Hennssy"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "Hennssy"),
    Location(
        flag: "assets/images/usa.png",
        country: "United States",
        city: "New York"),
  ];
  late Location selectedLocation = locations[0];

  late List<Location> favoriteLocations = [
    locations[0],
    locations[1],
    locations[2],
  ];
  setCurrentLocation(Location location) {
    selectedLocation = location;
    notifyListeners();
  }

  favoriteLocation(Location location) {
    if (favoriteLocations.contains(location)) {
      favoriteLocations.remove(location);
    } else {
      favoriteLocations.add(location);
    }
    notifyListeners();
  }

  bool isFaviorte(Location location) {
    return favoriteLocations.contains(location);
  }

  reset() {
    locations = [];
    notifyListeners();
  }
}

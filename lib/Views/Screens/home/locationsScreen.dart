import 'package:flutter/material.dart';
import 'package:fullvpn/Controllers/locationsProvider.dart';
import 'package:fullvpn/Models/colorsModel.dart';
import 'package:fullvpn/Models/locationModel.dart';
import 'package:fullvpn/Views/Widgets/home/locationWidget.dart';
import 'package:provider/provider.dart';

class locationsScreen extends StatefulWidget {
  const locationsScreen({super.key});

  @override
  State<locationsScreen> createState() => _locationsScreenState();
}

class _locationsScreenState extends State<locationsScreen> {
  @override
  Widget build(BuildContext context) {
    List<Location> locations = context.watch<locationsProvider>().locations;
    List<Location> favLocations =
        context.watch<locationsProvider>().favoriteLocations;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text("Server Locations"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold, fontFamily: "outfit", fontSize: 22),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // Note: Same code is applied for the TextFormField as well
            Container(
              child: TextFormField(
                  decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                prefixIcon: const Image(
                  image: AssetImage("assets/images/fi_search.png"),
                  color: null,
                  height: 30,
                  width: 30,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: myColors.secondaryColor
                          .withOpacity(0.4)), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(14.0),
                ),
                hintText: "Search locations...",
                hintStyle: TextStyle(
                    color: myColors.secondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Favorite Servers",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: favLocations.length * 80,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: favLocations.length,
                  itemBuilder: (context, index) {
                    return LocationWidget(location: favLocations[index]);
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "All Servers",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    if (favLocations.contains(locations[index]) == false) {
                      return LocationWidget(location: locations[index]);
                    } else {
                      return Container();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

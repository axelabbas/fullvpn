import 'package:flutter/material.dart';
import 'package:fullvpn/Controllers/locationsProvider.dart';
import 'package:fullvpn/Models/colorsModel.dart';
import 'package:fullvpn/Models/locationModel.dart';
import 'package:provider/provider.dart';

class locationWidget extends StatefulWidget {
  late Location location;
  locationWidget({required this.location, Key? key});
  @override
  State<locationWidget> createState() => _locationWidgetState();
}

class _locationWidgetState extends State<locationWidget> {
  @override
  Widget build(BuildContext context) {
    Location currentSelectedLocation =
        context.watch<locationsProvider>().selectedLocation;

    return GestureDetector(
      onTap: () {
        context.read<locationsProvider>().setCurrentLocation(widget.location);
      },
      child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: (currentSelectedLocation == widget.location)
                ? Border.all(color: myColors.primaryColor, width: 1.5)
                : null,
          ),
          child: Center(
            child: ListTile(
              leading: Image(
                image: new AssetImage(widget.location.flag),
                color: null,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
              title: Text(
                widget.location.country,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              subtitle: Text(
                widget.location.city,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: new AssetImage("assets/images/network.png"),
                    color: null,
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<locationsProvider>()
                          .favoriteLocation(widget.location);
                    },
                    icon: context
                            .read<locationsProvider>()
                            .isFaviorte(widget.location)
                        ? Image(
                            image: new AssetImage("assets/images/star.png"),
                            color: null,
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                          )
                        : Image(
                            image: new AssetImage(
                                "assets/images/starDisabled.png"),
                            color: null,
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                          ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

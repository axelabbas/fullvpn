import 'package:flutter/material.dart';
import 'package:fullvpn/Controllers/locationsProvider.dart';
import 'package:fullvpn/Models/colorsModel.dart';
import 'package:fullvpn/Models/locationModel.dart';
import 'package:provider/provider.dart';

class LocationWidget extends StatefulWidget {
  final Location location;
  LocationWidget({super.key, required this.location});
  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
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
                image: AssetImage(widget.location.flag),
                color: null,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
              title: Text(
                widget.location.country,
                style: const TextStyle(
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
                  const Image(
                    image: AssetImage("assets/images/network.png"),
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
                        ? const Image(
                            image: AssetImage("assets/images/star.png"),
                            color: null,
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                          )
                        : const Image(
                            image: AssetImage("assets/images/starDisabled.png"),
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

import 'package:flutter/material.dart';
import 'package:fullvpn/Models/colorsModel.dart';

class settingsTile extends StatefulWidget {
  late String title;
  late String subtitle;
  late IconData icon;
  late Widget trailing;
  settingsTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.trailing});

  @override
  State<settingsTile> createState() => _settingsTileState();
}

class _settingsTileState extends State<settingsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: ListTile(
          horizontalTitleGap: 20,
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: myColors.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Icon(
              widget.icon,
              color: Colors.white,
            ),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            widget.subtitle,
            style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          trailing: widget.trailing),
    );
  }
}

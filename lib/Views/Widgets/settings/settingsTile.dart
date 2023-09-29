import 'package:flutter/material.dart';
import 'package:fullvpn/Models/colorsModel.dart';

class SettingsTile extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Widget? trailing;
  final Color? color;
  const SettingsTile(
      {super.key,
      this.title,
      this.subtitle,
      this.icon,
      this.trailing,
      this.color});

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 20,
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: myColors.primaryColor.withOpacity(.25),
                borderRadius: BorderRadius.circular(10)),
            child: Icon(
              widget.icon,
              color: widget.color ?? myColors.primaryColor,
            ),
          ),
          title: Text(
            widget.title ?? "",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: widget.subtitle != null
              ? Text(
                  widget.subtitle ?? "",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              : null,
          trailing: widget.trailing),
    );
  }
}

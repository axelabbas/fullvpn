import 'package:flutter/material.dart';

class speedWidget extends StatefulWidget {
  speedWidget({required this.speed, required this.icon, required this.color});
  final IconData icon;
  final String speed;
  final Color color;
  @override
  State<speedWidget> createState() => _speedWidgetState();
}

class _speedWidgetState extends State<speedWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(widget.icon, color: widget.color),
        Text(widget.speed,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text("MB",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 10,
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}

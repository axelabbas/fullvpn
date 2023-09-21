// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fullvpn/Controllers/powerButtonProvider.dart';
import 'package:fullvpn/Models/colorsModel.dart';
import 'package:fullvpn/Views/Widgets/home/powerWidget.dart';
import 'package:fullvpn/Views/Widgets/home/speedWidget.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen>
    with AutomaticKeepAliveClientMixin<homeScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {


    super.build(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage(
                "assets/images/Map.png",
              ),
              alignment: Alignment.center,
              fit: BoxFit.fitWidth)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
              Colors.transparent,
              Colors.black,
            ])),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: new AssetImage("assets/images/Logo.png"),
                      color: null,
                      width: 35,
                      height: 35,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                    ),
                    Image(
                      image: new AssetImage("assets/images/crown.png"),
                      color: null,
                      width: 35,
                      height: 35,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Image(
                  image: new AssetImage("assets/images/failedSheild.png"),
                  color: null,
                  width: 24,
                  height: 24,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
                Text(
                  "Disconnected",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "00:00:00",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Real IP : 37.237.157.8",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    speedWidget(
                        speed: "0",
                        icon: Icons.keyboard_arrow_down,
                        color: Colors.red),
                    SizedBox(
                      width: 40,
                    ),
                    speedWidget(
                        speed: "0",
                        icon: Icons.keyboard_arrow_up,
                        color: Colors.green)
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(14),
                        border:
                            Border.all(color: Color(0xFF38383A), width: 1.5)),
                    child: ListTile(
                      leading: Image(
                        image: new AssetImage("assets/images/usa.png"),
                        color: null,
                        width: 35,
                        height: 35,
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                      ),
                      title: Text(
                        "United States",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      subtitle: Text(
                        "New York",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      trailing:
                          Icon(Icons.keyboard_arrow_right, color: Colors.white),
                    )),
                SizedBox(
                  height: 48,
                ),
                powerWidget(),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Tap to Connect",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

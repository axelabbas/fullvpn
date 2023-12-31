// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullvpn/Controllers/locationsProvider.dart';
import 'package:fullvpn/Controllers/powerButtonProvider.dart';
import 'package:fullvpn/Models/colorsModel.dart';
import 'package:fullvpn/Models/locationModel.dart';
import 'package:fullvpn/Views/Screens/home/locationsScreen.dart';
import 'package:fullvpn/Views/Widgets/home/powerWidget.dart';
import 'package:fullvpn/Views/Widgets/home/speedWidget.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen>
    with
        AutomaticKeepAliveClientMixin<homeScreen>,
        SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  late final CustomTimerController _controller = CustomTimerController(
      vsync: this,
      begin: Duration(days: 0, hours: 0, minutes: 0, seconds: 0),
      end: Duration(hours: 24),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.seconds);
  @override
  Widget build(BuildContext context) {
    Location location = context.watch<locationsProvider>().selectedLocation;
    bool isOn = context.watch<powerbuttonProvider>().isOn;
    bool isLoading = context.watch<powerbuttonProvider>().isLoading;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    context.read<powerbuttonProvider>().setTimeController(_controller);
    super.build(context);
    return Container(
      height: screenHeight,
      decoration: BoxDecoration(
          color: myColors.bgColor,
          image: DecorationImage(
              image: AssetImage(
                "assets/images/Map.png",
              ),
              alignment: Alignment.center,
              fit: BoxFit.fitWidth)),
      child: Container(
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.grey.withOpacity(0.15),
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage("assets/images/Logo.png"),
                          color: null,
                          width: screenWidth * 0.1,
                          height: screenWidth * 0.1,
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                        ),
                        Image(
                          image: AssetImage("assets/images/crown.png"),
                          color: null,
                          width: screenWidth * 0.1,
                          height: screenWidth * 0.1,
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Image(
                      image: AssetImage(isOn
                          ? "assets/images/runningSheild.png"
                          : "assets/images/failedSheild.png"),
                      color: null,
                      width: screenWidth * 0.08,
                      height: screenWidth * 0.08,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      isOn
                          ? "Connected"
                          : isLoading
                              ? "Connecting..."
                              : "Disconnected",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: isOn
                            ? myColors.greenAccent
                            : isLoading
                                ? myColors.orangeAccent
                                : Colors.white.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.035,
                    ),
                    CustomTimer(
                        controller: _controller,
                        builder: (state, time) {
                          // Build the widget you want!🎉
                          return Text(
                            "${time.hours}:${time.minutes}:${time.seconds}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 5,
                                fontSize: 30,
                                fontFamily: 'Monospace',
                                textBaseline: TextBaseline.alphabetic,
                                fontWeight: FontWeight.w500),
                          );
                        }),
                    // Text(
                    //   isOn ? "$time" : "00:00:00",
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       letterSpacing: 5,
                    //       fontSize: 30,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    SizedBox(
                      height: screenHeight * 0.045,
                    ),
                    isOn
                        ? RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: myColors.primaryColor,
                                    fontFamily: "outfit",
                                    fontSize: 20),
                                children: [
                                  TextSpan(
                                      text: "New IP",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: " : 62.241.27.39",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white.withOpacity(0.6),
                                      )),
                                ]),
                          )
                        : Text(
                            "Real IP : 37.237.15.82",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 18),
                          ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        speedWidget(
                            speed: "0",
                            icon: Icons.keyboard_arrow_down,
                            color: Colors.red),
                        SizedBox(
                          width: screenWidth * 0.1,
                        ),
                        speedWidget(
                            speed: "0",
                            icon: Icons.keyboard_arrow_up,
                            color: Colors.green)
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.black,
                      ),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {
                            print(location.city);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => locationsScreen()));
                          },
                          child: Container(
                              height: screenHeight * .09,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                      color: Color(0xFF38383A), width: 1.5)),
                              child: Center(
                                child: ListTile(
                                  leading: Image(
                                    image: AssetImage(location.flag),
                                    color: null,
                                    width: screenWidth * 0.08,
                                    height: screenWidth * 0.08,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  ),
                                  title: Text(
                                    location.country,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  subtitle: Text(
                                    location.city,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  trailing: Icon(Icons.keyboard_arrow_right,
                                      color: Colors.white),
                                ),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.07,
                    ),
                    powerWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    AnimatedOpacity(
                      opacity: isOn ? 0 : 1,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        "Tap to Connect",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

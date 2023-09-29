import 'package:flutter/material.dart';
import 'package:fullvpn/Controllers/locationsProvider.dart';
import 'package:fullvpn/Controllers/powerButtonProvider.dart';
import 'package:fullvpn/Controllers/profileProvider.dart';
import 'package:fullvpn/Controllers/settingsProvider.dart';
import 'package:fullvpn/Views/bnb.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<powerbuttonProvider>(
          create: (context) => powerbuttonProvider()),
      ChangeNotifierProvider<locationsProvider>(
          create: (context) => locationsProvider()),
      ChangeNotifierProvider(create: (context) => settingsProvider()),
      ChangeNotifierProvider(create: (context) => profileProvider())
    ],
    child: MaterialApp(
      home: const bottomNav(),
      theme: ThemeData(fontFamily: 'outfit'),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

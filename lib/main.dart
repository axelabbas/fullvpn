import 'package:flutter/material.dart';
import 'package:fullvpn/Controllers/locationsProvider.dart';
import 'package:fullvpn/Controllers/powerButtonProvider.dart';
import 'package:fullvpn/Views/bnb.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<powerbuttonProvider>(
          create: (context) => powerbuttonProvider()),
      ChangeNotifierProvider<locationsProvider>(
          create: (context) => locationsProvider())
    ],
    child: MaterialApp(
      home: const bottomNav(),
      theme: ThemeData(fontFamily: 'outfit'),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

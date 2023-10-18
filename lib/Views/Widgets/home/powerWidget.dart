import 'package:flutter/material.dart';
import 'package:fullvpn/Controllers/powerButtonProvider.dart';
import 'package:fullvpn/Models/colorsModel.dart';
import 'package:provider/provider.dart';

class powerWidget extends StatefulWidget {
  const powerWidget({
    super.key,
  });

  @override
  State<powerWidget> createState() => _powerWidgetState();
}

class _powerWidgetState extends State<powerWidget> {
  @override
  Widget build(BuildContext context) {
    Color bgColor = context.watch<powerbuttonProvider>().bgColor;
    bool isOn = context.watch<powerbuttonProvider>().isOn;
    bool isGlowing = context.watch<powerbuttonProvider>().isGlowing;
    double progress = context.watch<powerbuttonProvider>().progress;
    Color progressColor = context.watch<powerbuttonProvider>().progressColor;
    return InkWell(
      onTap: () async {
        if (isOn) {
          context.read<powerbuttonProvider>().turnOff();
        } else {
          await context.read<powerbuttonProvider>().startLoading();
        }
      },
      child: Stack(children: [
        AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              boxShadow: (isGlowing
                  ? (isOn
                      ? [
                          BoxShadow(
                              color: bgColor.withOpacity(0.3),
                              blurRadius: 2,
                              spreadRadius: 13,
                              offset: const Offset(0, 0)),
                          BoxShadow(
                              color: bgColor.withOpacity(0.2),
                              blurRadius: 2,
                              spreadRadius: 26,
                              offset: const Offset(0, 0)),
                        ]
                      : [
                          BoxShadow(
                              color: myColors.primaryColor.withOpacity(0.3),
                              blurRadius: 20,
                              spreadRadius: 15,
                              offset: const Offset(0, 0)),
                        ])
                  : null),
              borderRadius: BorderRadius.circular(100),
              color: bgColor,
              // border: Border(left: BorderSide(color: border, width: 5), ),
            ),
            child: const Icon(
              Icons.power_settings_new,
              color: Colors.white,
              size: 40,
            )),
        SizedBox(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
              color: progressColor,
              value: progress,
            )),
      ]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullvpn/Models/colorsModel.dart';
import 'package:fullvpn/Views/Widgets/settings/settingsTile.dart';

class settingsScreen extends StatefulWidget {
  const settingsScreen({super.key});

  @override
  State<settingsScreen> createState() => _settingsScreenState();
}

class _settingsScreenState extends State<settingsScreen> {
  bool killSwitch = false;
  bool autoStart = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Text(
            "Settings",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "VPN connection",
                style: TextStyle(
                    color: myColors.secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          settingsTile(
            title: 'Protocol',
            subtitle: "Automatic",
            icon: Icons.shield,
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: myColors.secondaryColor,
              size: 16,
            ),
          ),
          settingsTile(
            title: 'Auto Start',
            subtitle: "Automatically connect to VPN on app launch",
            icon: Icons.wifi,
            trailing: CupertinoSwitch(
              trackColor: myColors.secondaryColor.withOpacity(0.2),
              value: autoStart,
              onChanged: (value) {
                setState(() {
                  autoStart = value;
                });
              },
              activeColor: myColors.primaryColor,
            ),
          ),
          settingsTile(
            title: 'Kill Switch',
            subtitle: "Disable the internet if VPN disconnects",
            icon: Icons.wifi_lock,
            trailing: CupertinoSwitch(
              trackColor: myColors.secondaryColor.withOpacity(0.2),
              value: killSwitch,
              onChanged: (value) {
                setState(() {
                  killSwitch = value;
                });
              },
              activeColor: myColors.primaryColor,
            ),
          ),
          settingsTile(
              title: 'Reinstall VPN Profile',
              subtitle: "Try if you have connectivity issues",
              icon: Icons.restart_alt,
              trailing: Container(
                height: 10,
                width: 10,
              )),
          settingsTile(
            title: 'Split Tunneling',
            subtitle: "Disable VPN for selected apps",
            icon: Icons.call_split_outlined,
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: myColors.secondaryColor,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullvpn/Controllers/settingsProvider.dart';
import 'package:fullvpn/Models/colorsModel.dart';
import 'package:fullvpn/Views/Widgets/settings/settingsTile.dart';
import 'package:provider/provider.dart';

class settingsScreen extends StatefulWidget {
  const settingsScreen({super.key});

  @override
  State<settingsScreen> createState() => _settingsScreenState();
}

class _settingsScreenState extends State<settingsScreen> {
  @override
  Widget build(BuildContext context) {
    bool killSwitch = context.watch<settingsProvider>().killSwitch;
    bool autoStart = context.watch<settingsProvider>().autoStart;
    return Container(
      color: myColors.bgColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Text(
                "Settings",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
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
              SettingsTile(
                title: 'Protocol',
                subtitle: "Automatic",
                icon: Icons.shield,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: myColors.secondaryColor,
                  size: 16,
                ),
              ),
              SettingsTile(
                title: 'Auto Start',
                subtitle: "Automatically connect to VPN on app launch",
                icon: Icons.wifi,
                trailing: CupertinoSwitch(
                  trackColor: myColors.secondaryColor.withOpacity(0.2),
                  value: autoStart,
                  onChanged: (value) {
                    context.read<settingsProvider>().toggleAutoStart();
                  },
                  activeColor: myColors.primaryColor,
                ),
              ),
              SettingsTile(
                title: 'Kill Switch',
                subtitle: "Disable the internet if VPN disconnects",
                icon: Icons.wifi_lock,
                trailing: CupertinoSwitch(
                  trackColor: myColors.secondaryColor.withOpacity(0.2),
                  value: killSwitch,
                  onChanged: (value) {
                    context.read<settingsProvider>().toggleKillswitch();
                  },
                  activeColor: myColors.primaryColor,
                ),
              ),
              SettingsTile(
                  title: 'Reinstall VPN Profile',
                  subtitle: "Try if you have connectivity issues",
                  icon: Icons.restart_alt,
                  trailing: Container(
                    height: 10,
                    width: 10,
                  )),
              SettingsTile(
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
        ),
      ),
    );
  }
}

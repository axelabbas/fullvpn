import 'package:flutter/material.dart';
import 'package:fullvpn/Controllers/profileProvider.dart';
import 'package:fullvpn/Models/colorsModel.dart';
import 'package:fullvpn/Views/Screens/profile/loginScreen.dart';
import 'package:fullvpn/Views/Widgets/settings/settingsTile.dart';
import 'package:provider/provider.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = context.watch<profileProvider>().isLogged;
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "Settings",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              if (isLoggedIn)
                Container()
              else ...[
                Image(
                  image: AssetImage("assets/images/notLogged.png"),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Protection of up to 6 decives \nthrough a single account",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginScreen()));
                      },
                      child: Center(
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: myColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14))),
                    )),
                SizedBox(
                  height: 25,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginScreen()));
                      },
                      child: Center(
                        child: Text(
                          "Existing User? Login",
                          style: TextStyle(
                              color: myColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: myColors.primaryColor, width: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14))),
                    )),
                SizedBox(
                  height: 25,
                ),
              ],
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Account",
                  style: TextStyle(
                      color: myColors.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Text(
                  isLoggedIn ? "User ID:" : "Guest User ID:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "123456",
                  style: TextStyle(
                      color: myColors.secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Text(
                  "Expires:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "23 May 2021",
                  style: TextStyle(
                      color: myColors.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              if (isLoggedIn) ...[
                Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<profileProvider>().logout();
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout, color: Colors.red, size: 30),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF74E39).withOpacity(.2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14))),
                    )),
                SizedBox(
                  height: 25,
                ),
              ] else
                Container(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Purchase",
                  style: TextStyle(
                      color: myColors.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SettingsTile(
                title: "Restore Purchases",
                icon: Icons.recycling_outlined,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "General",
                  style: TextStyle(
                      color: myColors.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SettingsTile(
                title: "Contact Support",
                icon: Icons.chat_bubble_outline_rounded,
              ),
              SettingsTile(
                title: "Rate Us",
                icon: Icons.star_outline_rounded,
              ),
              SettingsTile(
                title: "Restore Purchases",
                icon: Icons.ios_share,
                color: myColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fullvpn/Controllers/powerButtonProvider.dart';
import 'package:fullvpn/Models/colorsModel.dart';
import 'package:fullvpn/Views/Screens/home/homeScreen.dart';
import 'package:provider/provider.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({super.key});

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  int _pageIndex = 0;
  List<Widget> _pages = [
    ChangeNotifierProvider<powerbuttonProvider>(
        create: (context) => powerbuttonProvider(), child: homeScreen()),
    homeScreen(),
    homeScreen(),
    homeScreen(),
  ];
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: myColors.secondaryColor, width: 0.2),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: myColors.primaryColor,
            backgroundColor: Colors.black,
            selectedFontSize: 12,
            selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold, color: myColors.primaryColor),
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold, color: myColors.secondaryColor),
            unselectedItemColor: myColors.secondaryColor,
            currentIndex: _pageIndex,
            onTap: (value) => setState(() {
                  _pageIndex = value;
                  _pageController.jumpToPage(_pageIndex);
                }),
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/Shield.png"),
                  ),
                  label: "VPN"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/Location.png"),
                  ),
                  label: "Location"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/Setting.png"),
                  ),
                  label: "Settings"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/Profile.png"),
                  ),
                  label: "Profile"),
            ]),
      ),
      body: Center(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _pages,
        ),
      ),
    );
  }
}

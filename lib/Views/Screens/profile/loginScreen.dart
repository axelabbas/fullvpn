import 'package:flutter/material.dart';
import 'package:fullvpn/Controllers/profileProvider.dart';
import 'package:fullvpn/Models/colorsModel.dart';
import 'package:provider/provider.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close))
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/circleApp.png"),
                    fit: BoxFit.cover),
              ),
              child: Image(image: AssetImage("assets/images/invertedlogo.png")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email Adress",
                      style: TextStyle(
                          color: myColors.secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                        decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: myColors.secondaryColor
                                .withOpacity(0.4)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      hintText: "Enter your email",
                      hintStyle: TextStyle(
                          color: myColors.secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(
                          color: myColors.secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                        decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility),
                      suffixIconColor: myColors.primaryColor,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: myColors.secondaryColor
                                .withOpacity(0.4)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      hintText: "Enter your password",
                      hintStyle: TextStyle(
                          color: myColors.secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Forgot Your Password?",
                    style: TextStyle(
                        color: myColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: OutlinedButton(
                        onPressed: () {
                          context.read<profileProvider>().login();
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: myColors.primaryColor,
                            // side: BorderSide(color: myColors.primaryColor, width: 2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14))),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Don't have an account yet? Sign up",
                    style: TextStyle(
                        color: myColors.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

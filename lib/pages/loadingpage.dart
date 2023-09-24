import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

//import '../main.dart';


class DelayedHomePage extends StatefulWidget {
  const DelayedHomePage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _DelayedHomePageState createState() => _DelayedHomePageState();
}

class _DelayedHomePageState extends State<DelayedHomePage> {
  @override
  void initState() {
    super.initState();
    // Delay the navigation by 2 seconds
    int? initTest = 0;
    Timer(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      initTest =  prefs.getInt('initOnbaord')??0;
      if (initTest == 0) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/OnboardingPage');
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/Auth');
      }});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/Images/Image1.jpg", 
              height: 150),
              const Padding(padding: EdgeInsets.only(top:100)),
            const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(64, 212, 0, 1))),
          ],
        ) 
      ),
    );
}
}
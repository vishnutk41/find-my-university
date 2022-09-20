import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:university/screens/HomePage/country_list.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5000,
      splash: Column(
        children: [
          Image.asset(
            'assets/images/launcher/UDB.png',
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      nextScreen: CountryListScreen(),
      splashIconSize: 360,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}

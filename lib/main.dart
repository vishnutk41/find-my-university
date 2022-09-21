// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'screens/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MainPage(),
      home: SplashScreen(),
    );
  }
}

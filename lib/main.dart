import 'package:homework5/pages/home/home_page.dart';
//import 'package:homework5/pages/pin_login/pin_login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BEERS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 44, 50, 236),
          //brightness: Brightness.dark,
        ),
        useMaterial3: true,
        backgroundColor: Colors.blue, 
      ),
      // home: const PinLoginPage(),
      home: const HomePage(),
    );
  }
}

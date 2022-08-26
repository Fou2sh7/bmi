import 'package:bmi_app/bmi_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 45,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          headline2: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      home: BmiScreen(),
    );
  }
}
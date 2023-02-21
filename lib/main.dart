import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/Home.dart';
import 'package:flutter_application_1/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:Homescreen()
    );
  }
}
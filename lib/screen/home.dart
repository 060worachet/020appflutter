import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/login.dart';
import 'package:flutter_application_1/screen/register.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

  body: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/fantasy_bg.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to Homepage",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black,
                  offset: Offset(5, 5),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Logout logic
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginScreen()));
            },
            child: Text(
              "Logout",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    ),
  ),
);

  }
}

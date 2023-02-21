import 'package:flutter/material.dart';

class Homepagess extends StatefulWidget {
  const Homepagess({super.key});

  @override
  State<Homepagess> createState() => _HomepagessState();
}

class _HomepagessState extends State<Homepagess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page')),
      body: Container(),
    );
  }
}
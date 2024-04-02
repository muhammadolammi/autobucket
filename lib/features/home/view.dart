import 'package:autobucket/components/appbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static String route = "/home";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: myAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: [Text("WELCOME TO AUTOBUCKET")],
        ),
      ),
    );
  }
}

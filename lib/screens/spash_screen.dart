import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mytiktaktoe/constants.dart';
import 'package:mytiktaktoe/screens/game_screen.dart/home_screen.dart';

class SpashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Container(
          height: 200,
          width: double.infinity,
          child: Column(
            children: [
              const FittedBox(
                child: Text(
                  "Welcome To TickTakToe",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(12),
                  backgroundColor: MaterialStateProperty.all(kBackgroundColor),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                child: const Text("PLAY!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

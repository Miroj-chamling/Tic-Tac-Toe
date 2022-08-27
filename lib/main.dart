import 'package:flutter/material.dart';
import 'package:mytiktaktoe/screens/game_screen.dart/home_screen.dart';
import './screens/spash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TickTakToe",
      theme: ThemeData.dark(),
      home: SpashScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}

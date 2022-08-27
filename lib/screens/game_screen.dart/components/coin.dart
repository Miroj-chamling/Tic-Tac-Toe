import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mytiktaktoe/constants.dart';
import 'package:mytiktaktoe/screens/game_screen.dart/components/select_options.dart';

class Coin extends StatefulWidget {
  @override
  State<Coin> createState() => _CoinState();
}

class _CoinState extends State<Coin> {
  List<String> probablity = ["HEADS", "TAILS"];
  String result = "HEADS";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
              child: FittedBox(
            child: Text(
              result,
              style: const TextStyle(
                fontSize: 20,
                color: kBackgroundColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(12),
              backgroundColor: MaterialStateProperty.all(kBackgroundColor),
              padding: MaterialStateProperty.all(EdgeInsets.all(14)),
            ),
            onPressed: onPressed,
            child: const Text(
              "Toss",
              style: TextStyle(fontSize: 16),
            )),
      ],
    );
  }

  String getHeadOrTails() {
    final _random = Random();
    String result = probablity[_random.nextInt(probablity.length)];
    return result;
  }

  void onPressed() {
    setState(() {
      result = "FLIPPING...";
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        result = getHeadOrTails();
      });
      Future.delayed(Duration(seconds: 1), () {
        chooseSideDialog("$result gets to pick a side");
      });
    });
  }

  Future chooseSideDialog(String title) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: kBackgroundColor,
          title: Text(title),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectOptions(
                option: "X",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(width: 10),
              SelectOptions(
                option: "O",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
}

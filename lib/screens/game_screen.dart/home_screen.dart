import 'package:flutter/material.dart';
import 'package:mytiktaktoe/constants.dart';
import 'package:mytiktaktoe/models/game_model.dart';
import 'package:mytiktaktoe/models/player.dart';
import 'package:mytiktaktoe/models/responsive_ui.dart';
import 'package:mytiktaktoe/screens/game_screen.dart/components/coin.dart';
import 'package:mytiktaktoe/screens/game_screen.dart/components/game_box.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const matrix = 3;
  static const double size = 100;

  @override
  void initState() {
    super.initState();
    buldGameContainer();
  }

  buldGameContainer() => setState(
        () => Player.gameMatrix = List.generate(
          matrix,
          (_) => List.generate(
            matrix,
            (_) => Player.none,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text("TikTakToe"),
        actions: [
          IconButton(
              onPressed: () => buldGameContainer(),
              icon: Icon(Icons.restart_alt)),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Coin(),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: kContainerColor,
                  borderRadius: BorderRadius.circular(20)),
              constraints: BoxConstraints.tightFor(
                width: ResponsiveUi.getWidth(context, 30.0),
                height: ResponsiveUi.getWidth(context, 30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: GameModel.gameModelBuilder(
                  Player.gameMatrix,
                  (index, model) => GameBox(
                    index: index,
                    matrix: Player.gameMatrix,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

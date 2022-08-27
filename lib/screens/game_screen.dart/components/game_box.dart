import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mytiktaktoe/constants.dart';
import 'package:mytiktaktoe/models/Player.dart';
import 'package:mytiktaktoe/models/game_model.dart';

class GameBox extends StatefulWidget {
  final index;
  final matrix;

  GameBox({
    required this.index,
    required this.matrix,
  });

  @override
  State<GameBox> createState() => _GameBoxState();
}

class _GameBoxState extends State<GameBox> {
  @override
  Widget build(BuildContext context) {
    final values = widget.matrix[widget.index];
    double size = 100;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: GameModel.gameModelBuilder(values, (y, value) {
        var value = widget.matrix[widget.index][y];
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(size, size), primary: kContainerCardColor),
            onPressed: () {
              selectField(value, widget.index, y);
            },
            child: value == Player.X
                ? Text(
                    value,
                    style: const TextStyle(color: Colors.red, fontSize: 60),
                  )
                : Text(
                    value,
                    style: const TextStyle(color: Colors.yellow, fontSize: 60),
                  ),
          ),
        );
      }),
    );
  }

  void selectField(String value, int x, int y) {
    if (value == Player.none) {
      var newValue = Player.lastMove == Player.X ? Player.O : Player.X;
      setState(() {
        Player.lastMove = newValue;
        widget.matrix[x][y] = newValue;
      });
      if (checkWinner(x, y)) {
        gameOverDialog('Player $newValue Won');
      } else if (checkDraw()) {
        gameOverDialog('Draw game');
      }
    }
  }

  bool checkWinner(int x, int y) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    final player = widget.matrix[x][y];
    const n = 3;
    for (int i = 0; i < n; i++) {
      if (widget.matrix[x][i] == player) col++;
      if (widget.matrix[i][y] == player) row++;
      if (widget.matrix[i][i] == player) diag++;
      if (widget.matrix[i][n - i - 1] == player) rdiag++;
    }

    return row == n || col == n || diag == n || rdiag == n;
  }

  bool checkDraw() {
    return widget.matrix.every(
        (List<String> values) => values.every((value) => value != Player.none));
  }

  Future gameOverDialog(String title) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: kBackgroundColor,
          title: Text(title),
          actions: [
            ElevatedButton(
              onPressed: () {
                print(widget.matrix);
                Navigator.of(context).pop();
              },
              child: const Text("Okay"),
            )
          ],
        ),
      );
}

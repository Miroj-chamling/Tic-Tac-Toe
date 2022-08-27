import 'package:flutter/material.dart';

class Player {
  static const none = "";
  static const X = "X";
  static const O = "O";
  static late List<List<String>> gameMatrix;
  static String lastMove = Player.none;
  static setPlayer() {
    String lastMove = Player.none;
  }
}

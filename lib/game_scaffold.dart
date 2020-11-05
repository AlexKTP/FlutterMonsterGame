import 'package:flutter/material.dart';
import 'package:monster_game/game_scene.dart';

class GameScaffold extends StatelessWidget {

  Size dimensions;
  GameScaffold(this.dimensions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameScene(dimensions).widget,
    );
  }
}

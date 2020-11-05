import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';
import 'package:monster_game/background.dart';
import 'package:monster_game/bomb.dart';
import 'package:monster_game/monster.dart';
import 'constants.dart';

class GameScene extends BaseGame with TapDetector {

  GameScene(this.dimensions) {
    this.add(Background());
  }

  Size dimensions;
  TextConfig scoreConfig = TextConfig(fontSize: 30, color: Colors.amberAccent, fontFamily: fontName);
  TextConfig gameOver = TextConfig(fontSize: 48, color: Colors.amberAccent, fontFamily: fontName);
  double canAdd = 3;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    (gameOn)
        ?scoreConfig.render(canvas, "Score: $score", Position(dimensions.width / 3, 30))
        : gameOver.render(canvas, "Game Over\n Score: $score\nRetry", Position(dimensions.width  /4, dimensions.height / 3));
    if (gameOn) {
      explosions.forEach((explosion) {
        explosion.render(canvas);
        canvas.restore();
        canvas.save();
      });
    }
  }

  @override
  void update(double t) {
    canAdd += t;
    if (canAdd >= 3) {
      canAdd = 0;
      Monster monster = Monster(randomMonster(), dimensions);
      add(monster);
      monsterInGame.add(monster);
    }
    explosions.forEach((element) {
      element.update(t);
    });
    explosions.removeWhere((element) => element.destroy());
    super.update(t);
  }

  @override
  void onTapUp(TapUpDetails details) {
    if (gameOn) {
      double positionX = details.globalPosition.dx - ((dimensions.width / 10) / 2);
      add(Bomb(dimensions, positionX));
    } else {
      start();
    }
  }

  String randomMonster() {
    int rand = Random().nextInt(4);
    return getMonster(rand + 1);
  }
}
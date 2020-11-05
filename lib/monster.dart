import 'dart:math';

import 'package:flame/components/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monster_game/constants.dart';

class Monster extends SpriteComponent {
  Size dimension;
  String name;
  bool shouldRemove = false;
  double maxY;

  Monster(this.name, this.dimension) : super.square(dimension.width / 10, name);

  @override
  void update(double dt) {
    this.y += (speed + score) * dt;
    //moveX();
    super.update(dt);
  }

  @override
  bool destroy() {
    if (!gameOn) {
      return true;
    } else if (maxY == null) {
      return true;
    } else if (y > maxY) {
      gameOver();
      return true;
    } else {
      return shouldRemove;
    }
  }

  @override
  void resize(Size size) {
    this.x = randomX();
    this.y = 10;
    this.maxY = dimension.height - 50;
  }

  double randomX() {
    if (dimension == null) {
      return 50;
    }
    int widthToInt = dimension.width.toInt();
    int maxPossibility = (widthToInt - (widthToInt ~/ 10));
    int random = Random().nextInt(maxPossibility);
    if (random.toDouble() == null) {
      return 50;
    } else {
      return random.toDouble();
    }
  }

  double moveX() {
    bool randomBool = Random().nextBool();
    (randomBool) ? this.x += 10 : this.x -= 10;
  }
}

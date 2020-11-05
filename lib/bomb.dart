import 'package:audioplayers/audioplayers.dart';
import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:monster_game/constants.dart';
import 'package:monster_game/explosion.dart';
import 'package:monster_game/monster.dart';

class Bomb extends SpriteComponent {
  Size dimension;
  double positionX;
  bool remove = false;
  AudioPlayer audioPlayer;

  Bomb(this.dimension, this.positionX)
      : super.square(dimension.width / 10, imageBombe);

  @override
  void resize(Size size) {
    // TODO: implement resize
    super.resize(size);
    this.x = positionX;
    this.y = dimension.height - 50;
  }

  @override
  void update(double dt) {
    this.y -= speed * dt;
    checkCollision();
    super.update(dt);
  }

  @override
  bool destroy() {
    if (gameOn) {
      if (y < 50) {
        return true;
      } else {
        return remove;
      }
    } else
      return true;
    return super.destroy();
  }

  void checkCollision() {
    monsterInGame.any((monster){
      var monsterRect = monster.toRect();
      var monsterBottom = monsterRect.bottomCenter;
      var monsterRight = monsterRect.bottomRight;
      var monsterLeft = monsterRect.bottomLeft;
      var me = this.toRect();
      if (me.contains(monsterBottom)) {
        kill(monster);
        return true;
      } else if (me.contains(monsterRight)) {
        kill(monster);
        return true;
      } else if (me.contains(monsterLeft)) {
        kill(monster);
        return true;
      } else
        return false;
    });
  }

  void kill(Monster monsterDetected) async {
    audioPlayer = await Flame.audio.play(explosion);
    score++;
    remove = true;
    monsterDetected.shouldRemove = true;
    monsterInGame.remove(monsterDetected);
    explosions.add(Explosion(monsterDetected));
  }
}

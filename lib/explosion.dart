import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:monster_game/constants.dart';
import 'package:monster_game/monster.dart';

class Explosion extends PositionComponent {
  static List<Image> imageExplosion = [];

  double lifeTime = 0;

  static void getImageExplosion() async {
    for (var x = 0; x < 14; x++) {
      imageExplosion.add(await Flame.images.load("e-$x.png"));
    }
  }

  Monster monster;

  Explosion(this.monster) {
    this.x = monster.x;
    this.y = monster.y;
  }

  @override
  void render(Canvas canvas) {
    double monsterSize = monster.width;
    canvas .translate(x- monsterSize / 2, y - monsterSize / 2);
    int index = (14 * lifeTime/ 0.75).round();
    if (imageExplosion.length> index && imageExplosion[index] != null) {
      Image currentImage = imageExplosion[index];
      Rect src = Rect.fromLTWH(0, 0, currentImage.width.toDouble(), currentImage.height.toDouble());
      Rect dst = Rect.fromLTWH(0, 0, monsterSize * 2, monsterSize * 2);
      canvas.drawImageRect(currentImage, src, dst, Paint());
    }
  }

  @override
  void update(double dt) {
    this.lifeTime += dt;
    print(lifeTime);
  }
}

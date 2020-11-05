import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:monster_game/constants.dart';
import 'package:monster_game/explosion.dart';
import 'package:monster_game/game_scaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.audio.loadAll([explosion, backGroundMusic]);
  if (gameOn){
    start();
  }
  Flame.audio.disableLog();
  Flame.util.setPortrait();
  Flame.images.loadAll(
      [imageBombe, monster1, monster2, monster3, monster4, background]);
  Explosion.getImageExplosion();
  Flame.util.setPortrait();
  Size dimensions = await Flame.util.initialDimensions();
  runApp(MyApp(dimensions));
}

class MyApp extends StatelessWidget {
  Size dimensions;

  MyApp(this.dimensions);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GameScaffold(dimensions),
    );
  }
}

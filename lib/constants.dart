import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flame/flame.dart';
import 'package:flame/flame_audio.dart';
import 'package:monster_game/explosion.dart';

import 'monster.dart';

String imageBombe = 'bomb.png';
String monster1 = 'monster-1.png';
String monster2 = 'monster-2.png';
String monster3 = 'monster-3.png';
String monster4 = 'monster-4.png';

String fontName = 'astron boy';

String explosion = 'explosion.mp3';
String backGroundMusic = 'music.mp3';

String background = 'background.png';

List<Explosion> explosions = [];

AudioPlayer audioPlayer;

String getMonster(int index) {
  switch (index) {
    case 1:
      return monster1;
    case 2:
      return monster2;
    case 3:
      return monster3;
    default:
      return monster4;
  }
}

String randomMonster() {
  int rand = Random().nextInt(4);
  return getMonster(rand + 1);
}

bool gameOn = true;
double speed = 100.0;

List<Monster> monsterInGame = [];
int score = 0;

void gameOver() async {
  gameOn = false;
  monsterInGame = [];
  audioPlayer.pause();
}

void start() async{
  score = 0;
  gameOn = true;
  audioPlayer = await Flame.audio.loopLongAudio(backGroundMusic);
}
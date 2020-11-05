import 'package:flame/components/parallax_component.dart';
import 'package:flutter/material.dart';
import 'package:monster_game/constants.dart';

class Background extends ParallaxComponent {

  static final images = [
    ParallaxImage(background, alignment: Alignment.center, fill: LayerFill.height)
  ];

  Background(): super(images);
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DipleIcons {
  static const abdominal_exercies = 'abdominal-exercises';
  static const abdominal_workout = 'abdominal-workout';
  static const back_exercises = 'back-exercises';
  static const build_muscles = 'build-muscles';
  static const chest_exercises = 'chest-exercises';
  static const dumbbell_exercises = 'dumbbell-exercises';
  static const fitness_equipment = 'fitness-equipment';
  static const full_body_workout = 'full-body-workout';
  static const heartrate = 'heartrate';
  static const increase_energy = 'increase-energy';
  static const increase_strength = 'increase-strength';
  static const shoulder_exercies = 'shoulder-exercises';
  static const stopwatch = 'stopwatch';
  static const vitamins = 'vitamins';
  static const weight_loss = 'weight-loss';
  static const workout_achievement = 'workout-achievements';
}

class DipleIcon extends StatelessWidget {
  final String icon;
  final Color color;
  final double width;
  final double height;
  final BlendMode blendMode;

  const DipleIcon({
    Key key,
    this.icon,
    this.color,
    this.width,
    this.height,
    this.blendMode,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$icon.svg',
      width: width ?? 42.0,
      color: color,
      colorBlendMode: blendMode,
    );
  }
}

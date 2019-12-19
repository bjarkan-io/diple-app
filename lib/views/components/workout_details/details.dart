import 'package:diple/theme/icons.dart';
import 'package:diple/views/components/cards/diple_card.dart';
import 'package:diple/views/components/workout_details/step.dart';
import 'package:flutter/material.dart';

class WorkoutDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DipleCard(
      child: Column(
        children: [
          WorkoutStep(
            title: 'Lunges',
            tag: 'detail_icon_0',
            icon: DipleIcon(icon: DipleIcons.build_muscles),
          ),
          WorkoutStep(
            title: 'Pull-ups',
            tag: 'detail_icon_1',
            icon: DipleIcon(icon: DipleIcons.back_exercises),
          ),
          WorkoutStep(
            title: 'Shoulder presses',
            tag: 'detail_icon_2',
            icon: DipleIcon(icon: DipleIcons.shoulder_exercies),
          ),
          WorkoutStep(
            title: 'Handstand',
            tag: 'detail_icon_3',
            icon: DipleIcon(icon: DipleIcons.full_body_workout),
          ),
        ],
      ),
    );
  }
}

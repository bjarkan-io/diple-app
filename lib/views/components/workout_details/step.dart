import 'package:diple/views/components/hero/diple_hero.dart';
import 'package:diple/views/components/workout_details/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class WorkoutStep extends StatelessWidget {
  final String tag;
  final Widget icon;
  final String title;
  final String subtitle;
  final WorkoutVideo video;

  const WorkoutStep({
    Key key,
    this.title,
    this.subtitle,
    this.video,
    this.icon,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: DipleHero(
        tag: tag ?? title,
        child: icon,
      ),
      title: Text(title),
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 8.0,
            bottom: 8.0,
          ),
          child: MarkdownBody(
            data: '1. Stand tall with feet hip-width apart.',
          ),
        ),
      ],
    );
  }
}

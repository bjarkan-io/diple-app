import 'package:flutter/material.dart';

class DipleHero extends StatelessWidget {
  final String tag;
  final Widget child;

  const DipleHero({Key key, @required this.tag, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}

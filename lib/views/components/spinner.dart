import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  final double size;
  final Color color;
  final double strokeWidth;

  const Spinner({Key key, this.size, this.color, this.strokeWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: color != null ? AlwaysStoppedAnimation(color) : null,
      ),
    );
  }

  factory Spinner.small([Color color]) {
    return Spinner(
      size: 16.0,
      color: color,
      strokeWidth: 2.0,
    );
  }
}

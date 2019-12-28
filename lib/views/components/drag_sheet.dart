import 'package:flutter/material.dart';

class DragSheet extends StatelessWidget {
  final Widget child;

  const DragSheet({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4.0, top: 8.0),
            width: 36.0,
            height: 4.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Theme.of(context).disabledColor.withOpacity(0.2),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

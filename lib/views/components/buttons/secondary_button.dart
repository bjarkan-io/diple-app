import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const SecondaryButton({
    Key key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlineButton(
        padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 250),
          child: child,
          style: Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

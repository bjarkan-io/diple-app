import 'package:flutter/material.dart';

class AnimatedIconButton extends StatefulWidget {
  final AnimatedIconData icon;
  final VoidCallback onPressed;

  const AnimatedIconButton({Key key, this.icon, this.onPressed}) : super(key: key);

  @override
  _AnimatedIconButtonState createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton> with TickerProviderStateMixin {
  AnimationController _animationController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..addStatusListener(_animationListener);
  }

  void _animationListener(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      setState(() => _isPlaying = false);
    } else {
      setState(() => _isPlaying = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: widget.icon,
        progress: _animationController,
      ),
      onPressed: _handleOnPressed,
    );
  }

  bool get enabled => widget.onPressed != null;

  void _handleOnPressed() {
    if (_isPlaying) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    if (enabled) widget.onPressed();
  }
}

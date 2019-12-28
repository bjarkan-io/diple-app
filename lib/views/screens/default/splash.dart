import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 96,
          height: 96,
          child: FlareActor(
            'assets/rive/logo.flr',
            animation: 'loop',
          ),
        ),
      ),
    );
  }
}

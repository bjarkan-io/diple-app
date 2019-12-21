import 'package:diple/data/auth/auth.dart';
import 'package:diple/views/routes.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  void _authListener(BuildContext context) => Future.delayed(
      Duration(milliseconds: 1500), () => Navigator.pushReplacementNamed(context, Routes.root));

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (_, __) => _authListener(context),
      child: Scaffold(
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
      ),
    );
  }
}

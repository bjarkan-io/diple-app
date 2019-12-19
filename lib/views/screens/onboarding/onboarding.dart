import 'package:diple/data/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:diple/core/core.dart';

class OnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  context.bloc<AuthenticationBloc>().toString(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

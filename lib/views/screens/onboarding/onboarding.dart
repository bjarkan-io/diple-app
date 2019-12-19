import 'package:flutter/material.dart';

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
                  'diple',
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

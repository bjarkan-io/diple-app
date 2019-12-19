import 'package:diple/core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<FirebaseOptions>(
          future: Injector.resolve<FirebaseApp>().options,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.asMap.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

import 'package:diple/theme/diple.dart';
import 'package:diple/views/routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diple',
      theme: Diple.lightTheme(),
      darkTheme: Diple.darkTheme(),
      onGenerateRoute: Routes.router.generator,
    );
  }
}

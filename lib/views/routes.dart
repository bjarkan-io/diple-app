import 'package:diple/data/auth/auth.dart';
import 'package:diple/views/auth.dart';
import 'package:diple/views/home.dart';
import 'package:diple/views/screens/default/not_found.dart';
import 'package:diple/views/screens/default/splash.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const root = '/';

  static Router router = Router();

  static void configureRoutes() {
    router.notFoundHandler = Handler(
      handlerFunc: (context, params) => NotFoundScreen(),
    );
    router.define(root, handler: _rootHandler);
  }

  static final _rootHandler = Handler(
    handlerFunc: _getRootScreen,
  );

  static Widget _getRootScreen(BuildContext context, Map params) {
    final state = BlocProvider.of<AuthenticationBloc>(context).state;

    if (state is UserAuthenticated) {
      return HomeScreen();
    } else if (state is InitialAuthenticationState) {
      return SplashScreen();
    } else {
      return AuthScreen();
    }
  }
}

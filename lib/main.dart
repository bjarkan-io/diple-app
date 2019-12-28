import 'package:bloc/bloc.dart';
import 'package:diple/views/provider.dart';
import 'package:diple/views/routes.dart';
import 'package:flutter/material.dart';
import 'package:water/water.dart';

import 'core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SimpleBlocDelegate(
    await Water.getInstance(),
  );

  await Injector.setup(Environment.dev);

  Routes.configureRoutes();

  runApp(Provider());
}

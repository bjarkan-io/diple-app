import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BlocExtension on BuildContext {
  T bloc<T extends Bloc>() {
    return BlocProvider.of<T>(this);
  }

  dynamic state<T extends Bloc>() {
    return bloc().state;
  }
}

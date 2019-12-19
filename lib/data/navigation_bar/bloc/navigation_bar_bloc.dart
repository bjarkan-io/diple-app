import 'dart:async';
import 'package:bloc/bloc.dart';

class NavigationBarBloc extends Bloc<int, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(int index) async* {
    yield index;
  }
}

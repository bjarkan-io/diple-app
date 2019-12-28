import 'package:bloc_test/bloc_test.dart';
import 'package:diple/data/navigation_bar/navigation_bar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NavigationBarBloc', () {
    NavigationBarBloc bloc;

    setUp(() {
      bloc = NavigationBarBloc();
    });

    blocTest(
      'initial state is [0]',
      build: () => bloc,
      expect: <int>[0],
    );

    group('LoadNavigationBar', () {
      blocTest(
        'emits [0, n] when index is added',
        build: () => bloc,
        act: (bloc) {
          bloc.add(1);
          bloc.add(2);
          return;
        },
        expect: [0, 1, 2],
      );
      return bloc;
    });
  });
}

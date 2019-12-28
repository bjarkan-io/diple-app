import 'package:bloc_test/bloc_test.dart';
import 'package:diple/data/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'firebase.dart';
import 'repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('AuthenticationBloc', () {
    final user = MockFirebaseUser();
    FirebaseAuth auth;
    AuthBloc bloc;
    AuthRepository repository;

    setUp(() {
      auth = MockFirebaseAuth();
      repository = MockAuthRepository();
      bloc = AuthBloc(auth: auth, repository: repository);
    });

    test('throws AssertionError if AuthRepository || FirebaseAuth is null', () {
      expect(() => AuthBloc(auth: null, repository: repository), throwsA(isAssertionError));
      expect(() => AuthBloc(auth: auth, repository: null), throwsA(isAssertionError));
    });

    blocTest(
      'initial state is [InitialAuthState]',
      build: () => bloc,
      expect: <AuthState>[
        InitialAuthState(),
      ],
    );

    group('Authenticate', () {
      blocTest(
        'emits [InitialAuthState, Authenticating, Authenticated] when Authenticate is added and the event chain succeeds',
        build: () => bloc,
        act: (bloc) => bloc.add(Authenticate(user)),
        expect: [
          InitialAuthState(),
          Authenticating(),
          Authenticated(user),
        ],
      );
    });

    group('Deauthenticate', () {
      blocTest(
        'emits [InitialAuthState, Authenticating, Authenticated, Deauthenticated] when Authenticate is added and succeeds before Deauthenticate is added',
        build: () => bloc..add(Authenticate(user)),
        act: (bloc) => bloc.add(Deauthenticate()),
        expect: [
          InitialAuthState(),
          Authenticating(),
          Authenticated(user),
          Unauthenticated(),
        ],
      );
    });
  });
}

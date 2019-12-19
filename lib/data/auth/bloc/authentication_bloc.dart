import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:diple/data/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  FirebaseAuth _auth;
  StreamSubscription _authListener;

  AuthenticationBloc(FirebaseAuth auth) {
    assert(auth != null);
    _auth = auth;
    _authListener = _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  void _onAuthStateChanged(FirebaseUser user) {
    if (user != null) {
      add(AuthenticateUser(user));
    } else {
      add(DeauthenticateUser());
    }
  }

  @override
  Future<void> close() {
    _authListener.cancel();
    return super.close();
  }

  @override
  AuthenticationState get initialState => InitialAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AuthenticateUser) {
      yield UserAuthenticated(event.user);
    } else if (event is DeauthenticateUser) {
      yield UserUnauthenticated();
    } else if (event is RegisterAuthenticationError) {
      yield AuthenticationError(event.error);
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class InitialAuthenticationState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class UserAuthenticated extends AuthenticationState {
  final FirebaseUser user;

  UserAuthenticated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Authenticated { user: $user }';
}

class UserUnauthenticated extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationError extends AuthenticationState {
  final dynamic error;

  AuthenticationError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AuthenticationError { error: $error }';
}

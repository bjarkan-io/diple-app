import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AuthenticateUser extends AuthenticationEvent {
  final FirebaseUser user;

  AuthenticateUser(this.user);
  @override
  List<Object> get props => [user];

  @override
  String toString() => 'AuthenticateUser { user: $user }';
}

class DeauthenticateUser extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class RegisterAuthenticationError extends AuthenticationEvent {
  final dynamic error;

  RegisterAuthenticationError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'RegisterAuthenticationError { error: $error }';
}

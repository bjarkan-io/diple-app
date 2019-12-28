import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class InitialAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class VerifyingPhoneNumber extends AuthState {
  @override
  List<Object> get props => [];
}

class PhoneNumberVerified extends AuthState {
  final String verificationId;

  PhoneNumberVerified(this.verificationId);
  @override
  List<Object> get props => [verificationId];

  @override
  String toString() => 'PhoneNumberVerified { verificationId: $verificationId }';
}

class Authenticating extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  final FirebaseUser user;

  Authenticated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Authenticated { user: $user }';
}

class Unauthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final dynamic error;

  AuthError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AuthenticationError { error: $error }';
}

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthenticateAnonymous extends AuthEvent {
  @override
  List<Object> get props => [];
}

class VerifyPhoneNumber extends AuthEvent {
  final String phoneNumber;

  VerifyPhoneNumber(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];

  @override
  String toString() => 'VerifyPhoneNumber { phoneNumber: $phoneNumber }';
}

class FinalizePhoneNumberVerification extends AuthEvent {
  final String verificationId;

  FinalizePhoneNumberVerification(this.verificationId);

  @override
  List<Object> get props => [verificationId];

  @override
  String toString() => 'RegisterVerificationID { verificationId: $verificationId }';
}

class AuthenticatePhoneNumber extends AuthEvent {
  final String smsCode;

  AuthenticatePhoneNumber(this.smsCode);

  @override
  List<Object> get props => [smsCode];

  @override
  String toString() => 'AuthenticatePhoneNumber { smsCode: $smsCode }';
}

class Authenticate extends AuthEvent {
  final FirebaseUser user;

  Authenticate(this.user);
  @override
  List<Object> get props => [user];

  @override
  String toString() => 'AuthenticateUser { user: $user }';
}

class Deauthenticate extends AuthEvent {
  @override
  List<Object> get props => [];
}

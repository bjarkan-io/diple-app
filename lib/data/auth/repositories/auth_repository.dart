import 'package:diple/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AuthRepository extends ChangeNotifier {
  String get verificationId => _verificationId;

  FirebaseAuth _auth;
  String _verificationId;

  AuthRepository({@required FirebaseAuth auth}) {
    assert(auth != null);
    _auth = auth;
  }

  Future<void> authenticateAnonymous() async {
    await _auth.signInAnonymously();
  }

  Future<void> authenticatePhone(String code) async {
    final credential =
        PhoneAuthProvider.getCredential(verificationId: _verificationId, smsCode: code);
    _verificationCompleted(credential);
  }

  Future<void> verifyPhone(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 5),
      verificationCompleted: _verificationCompleted,
      codeSent: _codeSent,
      verificationFailed: _verificationFailed,
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
    );
  }

  void _verificationCompleted(AuthCredential credential) {
    _auth.signInWithCredential(credential);
  }

  void _codeSent(String verificationId, [int timeout]) {
    logger.d(verificationId);
    _verificationId = verificationId;
    notifyListeners();
  }

  void _verificationFailed(AuthException e) {
    logger.e(e);
    _verificationId = null;
    notifyListeners();
  }

  void _codeAutoRetrievalTimeout(String verificationId) {
    logger.d(verificationId);
    _verificationId = verificationId;
    notifyListeners();
  }
}

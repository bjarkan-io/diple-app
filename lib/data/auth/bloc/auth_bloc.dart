import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:diple/data/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirebaseAuth _auth;
  StreamSubscription _authListener;
  AuthRepository _repository;

  AuthBloc({
    @required FirebaseAuth auth,
    @required AuthRepository repository,
  }) {
    assert(auth != null);
    assert(repository != null);
    _auth = auth;
    _repository = repository;
    _authListener = _auth?.onAuthStateChanged?.listen(_onAuthStateChanged);
    _repository?.addListener(_onRepositoryChanged);
  }

  /// Listens to changes from [FirebaseAuth] and adds
  /// events accordingly
  void _onAuthStateChanged(FirebaseUser user) {
    if (user != null) {
      add(Authenticate(user));
    } else {
      add(Deauthenticate());
    }
  }

  /// Listens to the internal [verificationId] of [_repository]
  void _onRepositoryChanged() {
    if (_repository.verificationId != null) {
      add(FinalizePhoneNumberVerification(_repository.verificationId));
    }
  }

  @override
  Future<void> close() {
    _authListener?.cancel();
    return super.close();
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Authenticate) {
      yield* _mapAuthenticateToState(event);
    } else if (event is Deauthenticate) {
      yield* _mapDeauthenticateToState(event);
    } else if (event is VerifyPhoneNumber) {
      yield* _mapVerifyPhoneNumberToState(event);
    } else if (event is FinalizePhoneNumberVerification) {
      yield PhoneNumberVerified(event.verificationId);
    } else if (event is AuthenticatePhoneNumber) {
      yield* _mapAuthenticatePhoneNumberToState(event);
    } else if (event is AuthenticateAnonymous) {
      yield* _mapAuthenticateAnonymousToState(event);
    }
  }

  @override
  AuthState get initialState => InitialAuthState();

  Stream<AuthState> _mapAuthenticateToState(Authenticate event) async* {
    yield Authenticating();
    if (event.user != null) {
      yield Authenticated(event.user);
    } else {
      yield AuthError(ArgumentError.notNull('FirebaseUser'));
    }
  }

  Stream<AuthState> _mapDeauthenticateToState(Deauthenticate event) async* {
    try {
      if (await _auth.currentUser() != null) {
        await _auth.signOut();
      }
      yield Unauthenticated();
    } catch (e) {
      yield AuthError(e);
    }
  }

  Stream<AuthState> _mapVerifyPhoneNumberToState(VerifyPhoneNumber event) async* {
    yield VerifyingPhoneNumber();
    try {
      await _repository.verifyPhone(event.phoneNumber);
    } catch (e) {
      yield AuthError(e);
    }
  }

  Stream<AuthState> _mapAuthenticatePhoneNumberToState(AuthenticatePhoneNumber event) async* {
    yield Authenticating();
    try {
      await _repository.authenticatePhone(event.smsCode);
    } catch (e) {
      yield AuthError(e);
    }
  }

  Stream<AuthState> _mapAuthenticateAnonymousToState(AuthenticateAnonymous event) async* {
    yield Authenticating();
    try {
      await _repository.authenticateAnonymous();
    } catch (e) {
      yield AuthError(e);
    }
  }
}

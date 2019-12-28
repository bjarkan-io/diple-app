// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void dev() {
    final Container container = Container();
    container.registerFactory((c) => AppConfig.dev());
  }

  void prod() {
    final Container container = Container();
    container.registerFactory((c) => AppConfig.prod());
  }

  void repositories() {
    final Container container = Container();
    container.registerSingleton((c) => AuthRepository(auth: c<FirebaseAuth>()));
  }

  void blocs() {
    final Container container = Container();
    container.registerSingleton((c) =>
        AuthBloc(auth: c<FirebaseAuth>(), repository: c<AuthRepository>()));
  }
}

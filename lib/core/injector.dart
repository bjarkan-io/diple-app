import 'package:diple/core/config/firebase/firebase.dart';
import 'package:diple/core/core.dart';
import 'package:diple/data/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

/// Dependency injector (Kiwi wrapper).
/// Register all singletons, bloc factories, repositories etc.
/// using this class.
abstract class Injector {
  /// Returns the Kiwi container singleton
  static Container container;

  /// Setup for the `development` environment
  @Register.factory(AppConfig, constructorName: 'dev')
  void dev();

  /// Setup for the `production` environment
  @Register.factory(AppConfig, constructorName: 'prod')
  void prod();

  @Register.singleton(AuthenticationBloc)
  void blocs();

  static Future<void> setup(Environment environment) async {
    container = Container();

    var injector = _$Injector();

    switch (environment) {
      case Environment.dev:
        var app = await FirebaseApp.configure(
          name: 'Development',
          options: FirebaseConfig.development,
        );
        container.registerInstance(app);
        container.registerInstance(FirebaseAuth.fromApp(app));
        injector.dev();

        break;
      case Environment.prod:
        var app = await FirebaseApp.configure(
          name: 'Production',
          options: FirebaseConfig.production,
        );

        container.registerInstance(app);
        container.registerInstance(FirebaseAuth.fromApp(app));
        injector.prod();

        break;
    }

    injector.blocs();
  }

  /// Kiwi container resolver
  static final dynamic resolve = container.resolve;
}

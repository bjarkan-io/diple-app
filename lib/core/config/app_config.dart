import 'package:meta/meta.dart';
import 'environment.dart';

/// A configuration class containing different
/// global configurations
class AppConfig {
  /// Constructs an [AppConfig] object with the given [environment] and [demo] parameters
  AppConfig({
    @required Environment environment,
  })  : assert(environment != null),
        _environment = environment;

  /// Used in development environment
  factory AppConfig.dev() {
    return AppConfig(
      environment: Environment.dev,
    );
  }

  /// Used in production environment
  factory AppConfig.prod() {
    return AppConfig(
      environment: Environment.prod,
    );
  }

  /// The build configuration for the app
  Environment get environment => _environment;
  Environment _environment;
}

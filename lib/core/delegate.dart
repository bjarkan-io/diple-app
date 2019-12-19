import 'package:bloc/bloc.dart';
import 'package:diple/utils/logger.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// A BLoC delegate that intercepts transitions from any BLoC
class SimpleBlocDelegate extends HydratedBlocDelegate {
  /// Constructs a [SimpleBlocDelegate] object with the given [storage]
  SimpleBlocDelegate(HydratedStorage storage) : super(storage);

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.d(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    logger.e(error);
  }
}

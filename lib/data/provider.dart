import 'package:diple/app.dart';
import 'package:diple/core/core.dart';
import 'package:diple/data/auth/auth.dart';
import 'package:diple/data/navigation_bar/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (_) => Injector.resolve<AuthenticationBloc>(),
          ),
          BlocProvider<NavigationBarBloc>(
            create: (_) => NavigationBarBloc(),
          ),
        ],
        child: App(),
      );
}

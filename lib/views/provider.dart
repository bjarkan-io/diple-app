import 'package:diple/app.dart';
import 'package:diple/core/core.dart';
import 'package:diple/data/auth/auth.dart';
import 'package:diple/data/navigation_bar/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Provider extends StatefulWidget {
  @override
  _ProviderState createState() => _ProviderState();
}

class _ProviderState extends State<Provider> {
  Key key = UniqueKey();

  void resetBlocs() {
    setState(() => key = UniqueKey());
  }

  @override
  Widget build(BuildContext context) => BlocProvider<AuthBloc>(
        create: (_) => Injector.resolve<AuthBloc>(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) => resetBlocs(),
          condition: (prev, next) => next is Authenticated,
          child: MultiBlocProvider(
            key: key,
            providers: [
              BlocProvider<NavigationBarBloc>(
                create: (_) => NavigationBarBloc(),
              ),
            ],
            child: App(),
          ),
        ),
      );
}

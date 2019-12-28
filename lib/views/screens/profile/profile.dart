import 'package:diple/data/auth/auth.dart';
import 'package:diple/theme/diple.dart';
import 'package:diple/views/components/components.dart';
import 'package:flutter/material.dart';
import 'package:diple/core/core.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 16.0),
              centerTitle: false,
              title: Text(
                'Me',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Diple.getTextColor(context),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text(
                  (context.bloc<AuthBloc>().state as Authenticated)
                      .user
                      .metadata
                      .lastSignInTime
                      .toIso8601String(),
                ),
                SecondaryButton(
                  child: Text('Sign out'),
                  onPressed: () {
                    context.bloc<AuthBloc>().add(Deauthenticate());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:diple/data/auth/auth.dart';
import 'package:diple/theme/diple.dart';
import 'package:diple/views/components/spinner.dart';
import 'package:diple/views/routes.dart';
import 'package:diple/views/screens/onboarding/auth_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';
import 'package:diple/core/core.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController()..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => Navigator.pushReplacementNamed(context, Routes.root),
      condition: (prev, next) => next is Authenticated,
      child: Scaffold(
        body: Builder(builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    OnboardingStep(
                      title: 'Get fit now',
                      description:
                          'Follow the workouts of your favorite instructors, get detailed guidance, videos and more',
                      animationAsset: 'assets/rive/trainer.flr',
                    ),
                    OnboardingStep(
                      title: 'Something something',
                      description:
                          'Follow the workouts of your favorite instructors, get detailed guidance, videos and more',
                      animationAsset: 'assets/rive/trainer.flr',
                    ),
                    OnboardingStep(
                      title: 'Placeholder placeholder',
                      description:
                          'Follow the workouts of your favorite instructors, get detailed guidance, videos and more',
                      animationAsset: 'assets/rive/trainer.flr',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IndicatorRow(
                  count: 3,
                  selected: _pageController.hasClients ? _pageController.page.round() : 0,
                ),
              ),
              Expanded(
                child: Center(
                  child: _PrimaryContent(
                    onPressed: () => Scaffold.of(context).showBottomSheet(
                      (context) => AuthSheet(),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class IndicatorRow extends StatelessWidget {
  final int count;
  final int selected;

  const IndicatorRow({
    Key key,
    this.count,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) => i++).map((i) {
        return Container(
          margin: const EdgeInsets.all(4.0),
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: i == selected
                ? Theme.of(context).accentColor
                : Theme.of(context).unselectedWidgetColor,
            shape: BoxShape.circle,
          ),
        );
      }).toList(),
    );
  }
}

class OnboardingStep extends StatelessWidget {
  final String title;
  final String description;
  final String animationAsset;

  const OnboardingStep({
    Key key,
    this.title,
    this.description,
    this.animationAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.display2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Diple.getTextColor(context),
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  description,
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Rive(
              filename: animationAsset,
              animation: 'idle',
            ),
          ),
        ),
      ],
    );
  }
}

class _PrimaryContent extends StatelessWidget {
  final VoidCallback onPressed;
  const _PrimaryContent({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
          child: Text(
            'Sign in',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: onPressed,
        ),
        SizedBox(height: 16.0),
        if (Injector.resolve<AppConfig>().environment == Environment.dev) ...{
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Text.rich(
                  TextSpan(
                    text: 'Developer? ',
                    children: [
                      TextSpan(
                        text: 'Log in',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  context.bloc<AuthBloc>().add(AuthenticateAnonymous());
                },
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return state is Authenticating
                      ? Spinner.small()
                      : Icon(FontAwesomeIcons.codeBranch, size: 16);
                },
              ),
            ],
          ),
        },
      ],
    );
  }
}

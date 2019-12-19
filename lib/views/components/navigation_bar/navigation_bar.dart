import 'package:diple/data/navigation_bar/navigation_bar.dart';
import 'package:diple/theme/diple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBar extends StatefulWidget {
  final TabController controller;

  const NavigationBar({Key key, this.controller}) : super(key: key);
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  void _animateToPage(int index) {
    widget.controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBarBloc, int>(
      listener: (context, index) => _animateToPage(index),
      child: BlocBuilder(
        bloc: BlocProvider.of<NavigationBarBloc>(context),
        builder: (context, currentIndex) {
          return Material(
            color: Diple.getCardColor(context),
            elevation: 10,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: SafeArea(
              top: false,
              child: SizedBox(
                height: 72.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _item(
                        currentIndex: currentIndex,
                        index: 0,
                        icon: FontAwesomeIcons.dumbbell,
                        title: 'Workouts',
                      ),
                      _item(
                        currentIndex: currentIndex,
                        index: 1,
                        icon: FontAwesomeIcons.userCheck,
                        title: 'Instructors',
                      ),
                      _item(
                        currentIndex: currentIndex,
                        index: 2,
                        icon: FontAwesomeIcons.userAstronaut,
                        title: 'Me',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _item({int currentIndex, int index, IconData icon, String title}) {
    final selected = currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => _handleTap(index),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              AnimatedTheme(
                data: ThemeData(
                  iconTheme: IconThemeData(
                    color: selected ? DipleColors.limeGreen : Colors.grey[400],
                  ),
                ),
                child: Icon(
                  icon,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 500),
                  style: TextStyle(
                    color: selected ? DipleColors.limeGreen : Colors.grey[400],
                  ),
                  child: Text(
                    title,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleTap(int index) {
    BlocProvider.of<NavigationBarBloc>(context).add(index);
  }
}

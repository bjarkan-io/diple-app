import 'package:diple/theme/diple.dart';
import 'package:diple/views/components/hero/diple_hero.dart';
import 'package:diple/views/components/workout_details/details.dart';
import 'package:flutter/material.dart';

class WorkoutView extends StatefulWidget {
  @override
  _WorkoutViewState createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  ScrollController _scrollController;

  bool lastStatus = true;

  void _scrollListener() {
    if (shrinked != lastStatus) {
      setState(() {
        lastStatus = shrinked;
      });
    }
  }

  bool get shrinked {
    return _scrollController.hasClients && _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 100,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: DipleColors.limeGreen,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: DipleHero(
              tag: 'strongback',
              child: Text(
                'STRONG BACK',
                style: TextStyle(
                  color: DipleColors.limeGreen,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ColorFiltered(
                colorFilter:
                    ColorFilter.mode(DipleColors.dipleBlack.withOpacity(0.5), BlendMode.darken),
                child: Hero(
                  tag: 'strongback_image',
                  child: Image.network(
                    'https://img.maximummedia.ie/joe_co_uk/eyJkYXRhIjoie1widXJsXCI6XCJodHRwOlxcXC9cXFwvbWVkaWEtam9lY291ay5tYXhpbXVtbWVkaWEuaWUuczMuYW1hem9uYXdzLmNvbVxcXC93cC1jb250ZW50XFxcL3VwbG9hZHNcXFwvMjAxOVxcXC8wOFxcXC8wNTExMzg0NVxcXC9TY3JlZW5zaG90LTIwMTktMDgtMDUtYXQtMTEuMzguMjMucG5nXCIsXCJ3aWR0aFwiOjc2NyxcImhlaWdodFwiOjQzMSxcImRlZmF1bHRcIjpcImh0dHBzOlxcXC9cXFwvd3d3LmpvZS5jby51a1xcXC9hc3NldHNcXFwvaW1hZ2VzXFxcL2pvZWNvdWtcXFwvbm8taW1hZ2UucG5nP2lkPTBhODk3NjFkMGEzYzZmNTFmN2Q2XCIsXCJvcHRpb25zXCI6W119IiwiaGFzaCI6IjM4YWI1MzYyNzE4NTkwYzNkMWYzNjAwNTNlMGM1ZDMwNjg3NTRmYjYifQ==/screenshot-2019-08-05-at-11-38-23.png',
                    fit: BoxFit.cover,
                    color: DipleColors.dipleBlack,
                    colorBlendMode: BlendMode.color,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    'Exercises',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Diple.getTextColor(context),
                    ),
                  ),
                  WorkoutDetails(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

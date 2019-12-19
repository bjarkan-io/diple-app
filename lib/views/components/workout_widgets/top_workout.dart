import 'package:diple/theme/diple.dart';
import 'package:diple/theme/icons.dart';
import 'package:diple/views/components/cards/diple_card.dart';
import 'package:diple/views/components/hero/diple_hero.dart';
import 'package:diple/views/screens/workouts/workout.dart';
import 'package:flutter/material.dart';

class TopWorkoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WorkoutView(),
          ),
        );
      },
      child: DipleCard(
        image: DecorationImage(
          image: NetworkImage(
            'https://img.maximummedia.ie/joe_co_uk/eyJkYXRhIjoie1widXJsXCI6XCJodHRwOlxcXC9cXFwvbWVkaWEtam9lY291ay5tYXhpbXVtbWVkaWEuaWUuczMuYW1hem9uYXdzLmNvbVxcXC93cC1jb250ZW50XFxcL3VwbG9hZHNcXFwvMjAxOVxcXC8wOFxcXC8wNTExMzg0NVxcXC9TY3JlZW5zaG90LTIwMTktMDgtMDUtYXQtMTEuMzguMjMucG5nXCIsXCJ3aWR0aFwiOjc2NyxcImhlaWdodFwiOjQzMSxcImRlZmF1bHRcIjpcImh0dHBzOlxcXC9cXFwvd3d3LmpvZS5jby51a1xcXC9hc3NldHNcXFwvaW1hZ2VzXFxcL2pvZWNvdWtcXFwvbm8taW1hZ2UucG5nP2lkPTBhODk3NjFkMGEzYzZmNTFmN2Q2XCIsXCJvcHRpb25zXCI6W119IiwiaGFzaCI6IjM4YWI1MzYyNzE4NTkwYzNkMWYzNjAwNTNlMGM1ZDMwNjg3NTRmYjYifQ==/screenshot-2019-08-05-at-11-38-23.png',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            DipleColors.dipleBlack.withOpacity(0.75),
            BlendMode.darken,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'TOP WORKOUT',
                style: TextStyle(
                  letterSpacing: 1.8,
                  fontWeight: FontWeight.w700,
                  color: DipleColors.limeGreen,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: DipleHero(
                tag: 'strongback',
                child: Text(
                  'STRONG BACK',
                  style: TextStyle(
                    color: DipleColors.dipleWhite,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                height: 75,
                child: ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 16 : 4,
                        top: 4,
                        right: index == 19 ? 16 : 4,
                        bottom: 4,
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Material(
                          color: DipleColors.limeGreen,
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DipleHero(
                              tag: 'detail_icon_$index',
                              child: DipleIcon(
                                icon: DipleIcons.abdominal_workout,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

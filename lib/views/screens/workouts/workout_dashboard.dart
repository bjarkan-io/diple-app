import 'package:diple/theme/diple.dart';
import 'package:diple/views/components/workout_widgets/all_workouts.dart';
import 'package:diple/views/components/workout_widgets/top_workout.dart';
import 'package:flutter/material.dart';

class WorkoutDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 100,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 16.0),
                centerTitle: false,
                title: Text(
                  'Workouts',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Diple.getTextColor(context),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: TopWorkoutWidget(),
                    ),
                    AllWorkoutsWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

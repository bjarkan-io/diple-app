import 'package:diple/data/auth/auth.dart';
import 'package:diple/data/navigation_bar/navigation_bar.dart';
import 'package:diple/views/components/navigation_bar/navigation_bar.dart';
import 'package:diple/views/routes.dart';
import 'package:diple/views/screens/instructors/instructors.dart';
import 'package:diple/views/screens/profile/profile.dart';
import 'package:diple/views/screens/workouts/workout_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _tabController;

  List<Widget> tabs = [
    WorkoutDashboard(),
    InstructorsView(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.pushReplacementNamed(context, Routes.root);
        }
      },
      child: Scaffold(
        body: BlocBuilder<NavigationBarBloc, int>(
          builder: (context, index) {
            _tabController = TabController(
              vsync: this,
              length: 3,
              initialIndex: index,
            );
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: tabs,
                ),
                NavigationBar(
                  controller: _tabController,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

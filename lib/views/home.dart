import 'package:diple/views/components/navigation_bar/navigation_bar.dart';
import 'package:diple/views/profile.dart';
import 'package:diple/views/screens/instructors/instructors.dart';
import 'package:diple/views/screens/workouts/workout_dashboard.dart';
import 'package:flutter/material.dart';

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
    ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
      ),
    );
  }
}

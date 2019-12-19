import 'package:diple/theme/diple.dart';
import 'package:diple/views/components/instructor_card/instructor_card.dart';
import 'package:diple/views/components/search_bar/search_bar.dart';
import 'package:flutter/material.dart';

class InstructorsView extends StatefulWidget {
  @override
  _InstructorsViewState createState() => _InstructorsViewState();
}

class _InstructorsViewState extends State<InstructorsView> {
  TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

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
                'Instructors',
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 8.0,
                    right: 16.0,
                    bottom: 16.0,
                  ),
                  child: SearchBar(
                    controller: _searchController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Featured',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      color: DipleColors.dipleDark,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InstructorCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

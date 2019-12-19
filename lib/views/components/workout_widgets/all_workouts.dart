import 'package:diple/theme/diple.dart';
import 'package:diple/views/components/cards/diple_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllWorkoutsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DipleCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'YOUR WORKOUTS',
              style: TextStyle(
                letterSpacing: 1.8,
                fontWeight: FontWeight.w600,
                color: DipleColors.limeGreen,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              height: 75,
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 16 : 4,
                      top: 4,
                      right: index == 3 ? 16 : 4,
                      bottom: 4,
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Material(
                        color: DipleColors.limeGreen,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            FontAwesomeIcons.dumbbell,
                            color: DipleColors.dipleWhite,
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
      label: ListTile(
        dense: true,
        title: Text(
          'See all',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Diple.getTextColor(context),
          ),
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}

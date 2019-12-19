import 'package:diple/theme/diple.dart';
import 'package:diple/views/components/cards/diple_card.dart';
import 'package:flutter/material.dart';

class InstructorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        alignment: Alignment.bottomLeft,
        fit: StackFit.expand,
        children: [
          DipleCard(
            image: DecorationImage(
              image: NetworkImage(
                'https://www.theptdc.com/wp-content/uploads/2019/05/OpeningAGym_Feature-1.png',
              ),
              colorFilter: ColorFilter.mode(DipleColors.dipleDark, BlendMode.color),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 175),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SUPER TOP WORKOUT',
                    style: TextStyle(
                      color: DipleColors.lightGreen,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'by Joe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: DipleColors.dipleWhite,
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.network(
              'https://www.shogunfitness.net/wp-content/uploads/2019/01/Jef-carved-home-page2.png',
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:diple/theme/diple.dart';
import 'package:flutter/material.dart';

class DipleCard extends StatelessWidget {
  final Widget child;
  final Widget label;
  final DecorationImage image;

  const DipleCard({Key key, this.child, this.label, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      padding: EdgeInsets.only(top: 16.0, bottom: label != null ? 0.0 : 16.0),
      decoration: BoxDecoration(
        color: Diple.getCardColor(context),
        boxShadow: [
          BoxShadow(
            color: DipleColors.darkGreen.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0.5,
          ),
        ],
        image: image,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: label != null ? const EdgeInsets.only(bottom: 8.0) : EdgeInsets.zero,
            child: child,
          ),
          if (label != null) ...{
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.25,
                    color: Diple.getTextColor(context).withOpacity(0.25),
                  ),
                ),
              ),
              child: label,
            ),
          },
        ],
      ),
    );
  }
}

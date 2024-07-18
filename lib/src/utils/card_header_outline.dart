import 'package:flutter/material.dart';

class CardHeaderOutline extends StatelessWidget {
  const CardHeaderOutline({
    super.key,
    required this.title,
    required this.child,
    this.smallText,
    this.subTitle,
    this.widthPercentage = 1,
  });

  final String? smallText, subTitle;
  final String title;
  final Widget child;
  final double widthPercentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: child,
          ),
        ),
        // Container on top, positioned top right with slight overlap (top container)
        Positioned(
          top: 0,
          left: 32,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Text(title),
          ),
        ),
      ],
    );
  }
}

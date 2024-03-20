import 'package:flutter/material.dart';
import 'package:new_app/core/constants/string_manager.dart';

class DescriptionBoxWidget extends StatelessWidget {
  const DescriptionBoxWidget(
      {super.key,
      required this.pH,
      required this.pW,
      required this.description});
  final double pH;
  final double pW;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(pH * 0.01).copyWith(top: pH * 0.04),
          height: pH * 0.268,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.48),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStringManager.deatilsPageDescripition,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: pH * 0.024,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.9),
                    ),
              ),
              Divider(
                thickness: 0.4,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: pH * 0.02,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.9),
                    ),
              ),
            ],
          ),
        ),
        Positioned(
            right: pW * 0.0,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                elevation: 10,
                minimumSize: Size.fromRadius(pH * 0.05),
                shape: const CircleBorder(),
              ),
              child: Text(
                " Buy Now",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: pH * 0.018,
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            ))
      ],
    );
  }
}

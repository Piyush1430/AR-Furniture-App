import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key, required this.pageWidth});
  final double pageWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.menu,
              size: pageWidth * 0.078,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            )),
        GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.shopping_cart_outlined,
              size: pageWidth * 0.078,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            )),
      ],
    );
  }
}

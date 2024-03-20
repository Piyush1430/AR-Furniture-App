import 'package:flutter/material.dart';
import 'package:new_app/core/constants/assets_manager.dart';

class HotDealWidget extends StatelessWidget {
  const HotDealWidget(
      {super.key, required this.pageHeight, required this.pageWidth});
  final double pageHeight;
  final double pageWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: pageHeight * 0.24,
      width: pageWidth,
      child: Image.asset(
        AssetManager.hotDealsImage,
        fit: BoxFit.fitWidth,
         filterQuality: FilterQuality.high,
      ),
    );
  }
}

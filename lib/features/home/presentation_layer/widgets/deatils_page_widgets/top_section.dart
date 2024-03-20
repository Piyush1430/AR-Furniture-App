import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_app/core/constants/assets_manager.dart';

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({super.key, required this.pH, required this.pW});
  final double pH;
  final double pW;

  void _navigateToPreviousPage(BuildContext context) {
    Navigator.pop(context);
  }

  Widget customImage(String imagePath) => Image.asset(
        imagePath,
        fit: BoxFit.contain,
      );

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: SizedBox(
        height: pH * 0.04,
        child: Row(
          children: [
            GestureDetector(
                onTap: () => _navigateToPreviousPage(context),
                child: customImage(AssetManager.arrowLeftImage)),
            const Spacer(),
            customImage(
              AssetManager.shareImage,
            ),
            SizedBox(
              width: pW * 0.06,
            ),
            customImage(AssetManager.brokenHeartImage),
          ],
        ),
      ),
    );
  }
}

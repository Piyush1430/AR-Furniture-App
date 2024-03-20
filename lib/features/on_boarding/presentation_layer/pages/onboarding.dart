import "package:flutter/material.dart";
import "package:new_app/core/constants/assets_manager.dart";
import "package:new_app/core/constants/color_manager.dart";
import "package:new_app/core/constants/route_manager.dart";
import "package:new_app/core/constants/string_manager.dart";

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.screenSize});
 final Size screenSize;
  Widget whiteHallowLightImage(BoxConstraints constraints) {
    return Positioned(
      top: constraints.maxHeight * 0.285,
      right: constraints.maxWidth * 0.132,
      child: SizedBox(
        height: constraints.maxHeight * 0.218,
        width: constraints.maxWidth * 0.28,
        child: Image.asset(
          AssetManager.hallowLampImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget hangingLightsImage(Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height / 2),
      child: Container(
        width: double.infinity,
        height: screenSize.height / 1.8,
        color: ColorManager.cream,
        child: Image.asset(
          AssetManager.onBoardingImage,
          fit: BoxFit.fill,
          width: double.infinity,
          height: screenSize.height / 1.8,
        ),
      ),
    );
  }

  Widget onBoardingTextWidget({
    required BoxConstraints constraints,
    required String text,
    required BuildContext context,
  }) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontSize: constraints.maxHeight * 0.058));
  }

  Widget centreTextColumn(BoxConstraints constraints, BuildContext context) {
    return Positioned(
      top: constraints.maxHeight * 0.424,
      left: constraints.maxWidth * 0.07,
      child: SizedBox(
        height: constraints.maxHeight * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            onBoardingTextWidget(
              context: context,
              text: AppStringManager.onBoardingScreenElegant,
              constraints: constraints,
            ),
            onBoardingTextWidget(
              context: context,
              text: AppStringManager.onBoardingScreenSimple,
              constraints: constraints,
            ),
            onBoardingTextWidget(
              context: context,
              text: AppStringManager.onBoardingScreenFurnitures,
              constraints: constraints,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: BoxDecoration(color: ColorManager.grey),
            ),
            hangingLightsImage(screenSize),
            whiteHallowLightImage(constraints),
            centreTextColumn(
              constraints,
              context,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: constraints.maxHeight * 0.66,
                  left: constraints.maxWidth * 0.18),
              child: Text(
                AppStringManager.onBoardingScreenBody,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.textGrey,
                    fontSize: constraints.maxHeight * 0.022),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: constraints.maxHeight * 0.74,
                  left: constraints.maxWidth * 0.35),
              child: Image.asset(AssetManager.curveArrowImage),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: constraints.maxHeight * 0.7,
                  left: constraints.maxWidth * 0.63),
              child: InkWell(
                splashColor: ColorManager.brown.withOpacity(0.5),
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteStringManager.routeToHomePage, arguments: screenSize ,(route) => false);
                },
                child: Container(
                  height: constraints.maxHeight * 0.26,
                  width: constraints.maxWidth * 0.26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.brown,
                  ),
                  child: Center(
                    child: Text(
                      AppStringManager.onBoardingScreenButtonText,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: constraints.maxHeight * 0.022),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

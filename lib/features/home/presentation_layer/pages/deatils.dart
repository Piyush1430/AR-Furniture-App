import 'package:flutter/material.dart';
import 'package:new_app/features/home/domain_layer/entities/products.dart';
import 'package:new_app/features/home/presentation_layer/widgets/deatils_page_widgets/bottom_section_widget.dart';
import 'package:new_app/features/home/presentation_layer/widgets/deatils_page_widgets/centre_image_widget.dart';
import 'package:new_app/features/home/presentation_layer/widgets/deatils_page_widgets/descripition_widget.dart';
import 'package:new_app/features/home/presentation_layer/widgets/deatils_page_widgets/top_section.dart';
//import 'package:new_app/config/assets_manager.dart';

class DeatilsPage extends StatelessWidget {
  const DeatilsPage(
      {super.key,
      required this.pageHeight,
      required this.pageWidth,
      required this.product});
  final double pageHeight;
  final double pageWidth;
  final ProductsEntities product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: pageWidth * 0.04, vertical: pageHeight * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //top bar widegts
                TopSectionWidget(
                  pH: pageHeight,
                  pW: pageWidth,
                ),
                SizedBox(
                  height: pageHeight * 0.05,
                ),
                Text(
                  product.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: pageHeight * 0.026),
                ),
                SizedBox(
                  height: pageHeight * 0.08,
                ),
                //Centre image
                CenterImageWidget(
                  pH: pageHeight,
                  productimagePath: product.imageUrl,
                  productModelPath: product.modelUrl,
                ),
                SizedBox(
                  height: pageHeight * 0.06,
                ),
                // product Name
                Text(
                  product.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: pageHeight * 0.024),
                ),
                SizedBox(
                  height: pageHeight * 0.02,
                ),
                //Rating Sectiion
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.black,
                    ),
                    Text(
                      " 4.5 ",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: pageHeight * 0.02,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.5)),
                    ),
                    SizedBox(
                      width: pageWidth * 0.008,
                    ),
                    SizedBox(
                      height: pageHeight * 0.02,
                      child: VerticalDivider(
                        thickness: 0.4,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(
                      width: pageWidth * 0.008,
                    ),
                    Text(
                      " 355 Reviews ",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: pageHeight * 0.02,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.5)),
                    ),
                  ],
                ),
                SizedBox(
                  height: pageHeight * 0.01,
                ),
                //description
                DescriptionBoxWidget(
                  pH: pageHeight,
                  pW: pageWidth,
                  description: product.descripition,
                ),

                 SizedBox(
                  height: pageHeight * 0.065,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(pageHeight * 0.005),
        child: BottomWidget(
          pH: pageHeight,
          pW: pageWidth,
          product: product,
        ),
      ),
    );
  }
}

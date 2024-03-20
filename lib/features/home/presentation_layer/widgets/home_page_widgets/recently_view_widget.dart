import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/home/domain_layer/entities/products.dart';
import 'package:new_app/features/home/presentation_layer/bloc/product_bloc.dart';
import 'package:new_app/features/home/presentation_layer/pages/deatils.dart';

class RecentlyViewedWidget extends StatefulWidget {
  const RecentlyViewedWidget(
      {super.key,
      required this.products,
      required this.pageHeight,
      required this.pageWidth});
  final List<ProductsEntities> products;
  final double pageHeight;
  final double pageWidth;
  @override
  State<RecentlyViewedWidget> createState() => _RecentlyViewedWidgetState();
}

class _RecentlyViewedWidgetState extends State<RecentlyViewedWidget> {
  void _navigateToDeatilsPage(
      {required double pageWidth,
      required double pageHeight,
      required ProductsEntities product}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DeatilsPage(
              pageHeight: pageHeight, pageWidth: pageWidth, product: product),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final pH = widget.pageHeight;
    final pW = widget.pageWidth;
    return SizedBox(
      height: pH,
      width: pW,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 2),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: pW * 0.02),
            child: GestureDetector(
              onTap: () {
                context
                    .read<ProductBloc>()
                    .add(ProductRecentlyViewEvent(productsEntities: product));
              },
              child: GestureDetector(
                onTap: () => _navigateToDeatilsPage(
                    pageHeight: widget.pageHeight,
                    pageWidth: widget.pageWidth,
                    product: product),
                child: Stack(
                  children: [
                    Container(
                      width: pW * 0.510,
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.65),
                        ),
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.4),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.048,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    product.imageUrl,
                                    fit: BoxFit.contain,
                                    height: constraints.maxHeight * 0.7,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                                SizedBox(
                                  height: constraints.maxHeight * 0.01,
                                ),
                                Text(
                                  product.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: pH * 0.022),
                                ),
                                Text(
                                  " ₹ ${product.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: pH * 0.022,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

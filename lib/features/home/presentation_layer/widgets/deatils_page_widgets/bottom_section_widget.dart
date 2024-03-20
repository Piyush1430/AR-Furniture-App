import 'package:flutter/material.dart';
import 'package:new_app/core/constants/color_manager.dart';
import 'package:new_app/core/constants/string_manager.dart';
import 'package:new_app/features/home/domain_layer/entities/products.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget(
      {super.key, required this.pH, required this.pW, required this.product});
  final double pH;
  final double pW;
  final ProductsEntities product;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: pH * 0.08,
      padding: EdgeInsets.symmetric( vertical:  pH * 0.008 ,horizontal: pW*0.04),
      child: Row(
        children: [
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Theme.of(context).colorScheme.surface,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                elevation: 5,
              ),
              label: Text(
                AppStringManager.deatilsPageAddToCart,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: pH*0.022,
                    ),
              )),
          const Spacer(),
          Text(
            " ₹ ${product.price}",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: pH * 0.034,
                  color: ColorManager.moneyColor,
                ),
          ),
        ],
      ),
    );
  }
}

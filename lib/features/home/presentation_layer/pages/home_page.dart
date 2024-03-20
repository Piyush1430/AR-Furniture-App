import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constants/string_manager.dart';
import 'package:new_app/core/utils/show_snackbar.dart';
import 'package:new_app/core/widgets/loader.dart';
import 'package:new_app/features/home/presentation_layer/bloc/product_bloc.dart';
import 'package:new_app/features/home/presentation_layer/widgets/home_page_widgets/hot_deal._widget.dart';
import 'package:new_app/features/home/presentation_layer/widgets/home_page_widgets/new_arrival_widget.dart';
import 'package:new_app/features/home/presentation_layer/widgets/home_page_widgets/recently_view_widget.dart';
import 'package:new_app/features/home/presentation_layer/widgets/home_page_widgets/top_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.screenSize});
  final Size screenSize;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductFetchAllModelEvent());
  }



  Widget customText(
      String text, double pageWidth, BuildContext context, double pageHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pageWidth * 0.06),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontSize: pageHeight * 0.026),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageHeight = widget.screenSize.height;
    final pageWidth = widget.screenSize.width;
    return Scaffold(
        body: BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductModelLoadFailure) {
          showSnackBar(context, state.msg);
        }
      },
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Loader();
        }
        if (state is ProductModelLoadSucess) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // top bar Images
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: pageWidth * 0.06,
                        vertical: pageHeight * 0.02,
                      ).copyWith(
                        bottom: pageHeight * 0.05,
                      ),
                      child: TopBarWidget(
                        pageWidth: pageWidth,
                      )),
                  //Hot deal section
                  customText(AppStringManager.homePageHotDeal, pageWidth,
                      context, pageHeight),
                  HotDealWidget(pageHeight: pageHeight, pageWidth: pageWidth),

                  //New Arrival section
                  customText(AppStringManager.homePageNewArrival, pageWidth,
                      context, pageHeight),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: pageWidth * 0.06,
                      vertical: pageHeight * 0.02,
                    ),
                    child: NewArrivalWidget(
                      pageHeight: pageHeight,
                      pageWidth: pageWidth,
                      productsEntities: state.products,
                    ),
                  ),
                  SizedBox(
                    height: pageHeight * 0.02,
                  ),
                  //Recently view section
                  customText(AppStringManager.homePageRecentlyView, pageWidth,
                      context, pageHeight),

                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: pageWidth * 0.06,
                        vertical: pageHeight * 0.02,
                      ),
                      child:  RecentlyViewedWidget( products: state.products, pageHeight: pageHeight , pageWidth: pageWidth,)),
                     
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    ));
  }
}

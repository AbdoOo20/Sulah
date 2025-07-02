import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/presentation/component/component.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../../../../data/repository/SaveUserData.dart';
import '/core/resources/app_colors.dart';
import 'homeViewModel.dart';
import 'widgets/Custom_app_bar_home.dart';
import 'widgets/CustomCategoryList.dart';
import 'widgets/CustomFloatingActionButton.dart';
import 'widgets/custom_best_sell.dart';
import 'widgets/custom_near_to_you.dart';
import 'widgets/custom_prominent.dart';
import 'widgets/custom_search.dart';
import 'widgets/custom_slider.dart';

class Home extends StatefulWidget {
  final SaveUserData saveUserData;

  const Home({
    Key? key,
    required this.saveUserData,
    this.search,
  }) : super(key: key);

  final String? search;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _loadData(BuildContext context) async {
    await Provider.of<HomeViewModel>(context, listen: false).getSliderImages(
      context,
    );
    await Provider.of<HomeViewModel>(context, listen: false).getDepartments(
      context,
    );
    await Provider.of<HomeViewModel>(context, listen: false)
        .getNearStores(context, widget.search ?? '');
    await Provider.of<HomeViewModel>(context, listen: false)
        .getBestStores(context);
    await Provider.of<HomeViewModel>(context, listen: false)
        .getBestSeller(context);
    // // await Provider.of<HomeViewModel>(context, listen: false).getNotificationCount(context,);
  }

  @override
  void initState() {
    super.initState();
    _loadData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: const CustomFloatingActionButton(),
      body: Consumer<HomeViewModel>(
        builder: (context, data, child) => RefreshIndicator(
          onRefresh: () async => await _loadData(context),
          child: ScreenStateLayout(
            isLoading: data.sliderModel == null ||
                data.departmentsModel == null ||
                data.nearestStoresModel == null ||
                data.bestStoresModel == null ||
                data.bestSellerModel == null,
            builder: (context) => Column(
              children: [
                const CustomAppBarHome(),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 8.h),
                    children: const [
                      SizedBox(height: 8),
                      CustomSlider(),
                      CustomSearch(),
                      CustomCategoryList(),
                      // CustomNearToYouList(),
                      // CustomProminent(),
                      CustomBestSell(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

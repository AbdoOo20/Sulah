import 'package:flutter/cupertino.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/data/model/response/productsModel.dart';

import 'custom_card_products.dart';

class GridViewProducts extends StatelessWidget {
  const GridViewProducts({Key? key, this.model}) : super(key: key);
  final ProductsModel? model;

  @override
  Widget build(BuildContext context) {
    return model?.data?.isNotEmpty ??false?
      GridView.builder(
        shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 70.h),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .82,
            crossAxisSpacing: 8.h,
            mainAxisSpacing: 8.h,
          ),
          itemCount: model?.data?.length ?? 0,
          itemBuilder: (context, index) {
            return CustomCaredProducts(
              model: model?.data?[index],
              productIndex: index,
              whichScreen: "products",
            );
          })
      :const SizedBox();
  }
}

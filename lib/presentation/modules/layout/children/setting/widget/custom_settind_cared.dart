import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../data/repository/SaveUserData.dart';
import '../../../../../../injection.dart';
import '../../../../auth/auth_view_model.dart';


class CustomMyAccountCared extends StatelessWidget {
  const CustomMyAccountCared({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SaveUserData getUserId =getIt();
    final provider = Provider.of<AuthViewModel>(context, listen: true)
        .saveUserData
        ?.getUserData()
        ?.data;
    print('save#####${provider?.logo??''}');
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child:
              SizedBox(
                height: 96.h,
                width: 96.w,
                child:(getUserId.getUserData()?.data?.id !=null)? CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: provider?.logo??'',
                    placeholder: (context, url) =>
                    new Center(child: SizedBox(width:20,height:20,child: CircularProgressIndicator(strokeWidth: 1,))),
                errorWidget: (context, url, error) =>
                    Container(
                      height: 96.h,
                      width: 96.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.person),
                        ),
                      ),
                      // Image.asset(
                      //   Assets.splash,
                      //   fit: BoxFit.cover,
                      // ),
                    )
                ):Image.asset(Assets.iconApp),
              ),
            ),
          ],
        ),
        label((getUserId.getUserData()?.data?.id !=null)?'${provider?.name ?? ''}':'khedmaty'.tr()),
      ],
    );
  }

  Widget label(String label, {Color color = AppColors.black}) {
    return Padding(
      padding: EdgeInsets.only(top: AppPadding.p12.h, bottom: 28.h),
      child: Text(
        label,
        style: TextStyles().getTitleStyle(fontSize: 18.sp).customColor(color),
      ),
    );
  }
}

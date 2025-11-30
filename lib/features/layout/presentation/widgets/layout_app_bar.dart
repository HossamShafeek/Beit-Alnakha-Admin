import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_button.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/features/layout/presentation/cubits/side_bar_cubit/side_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LayoutAppBar extends StatelessWidget {
  const LayoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarCubit sideBarCubit = SideBarCubit.get(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppSize.size24,
            right: AppSize.size24,
            top: AppSize.size8,
            bottom: AppSize.size16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing:  AppSize.size16,
            children: [
              if(context.width < ScreenWidthBreakpoints.tablet)...[
                CustomContainerButton(imagePath: AppAssets.menu, onTap: (){
                  AppConstants.layoutKey.currentState?.openDrawer();
                },iconColor: AppColors.white,),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sideBarCubit.manageTitles[sideBarCubit.currentIndex],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppStyles.bold22(context).copyWith(
                        color: AppColors.primaryBlack ,
                      ),
                    ),
                    Text(
                      sideBarCubit.subtitles[sideBarCubit.currentIndex],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppStyles.regular16(
                        context,
                      ).copyWith(color: AppColors.grey88).copyWith(),
                    ),
                  ],
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(AppSize.size24),
                onTap: (){

                },
                child: CircleAvatar(
                  radius: AppSize.size24,
                  backgroundColor: AppColors.greyF5,
                  child: SvgPicture.asset(AppAssets.notifications,),
                ),
              ),
            ],
          ),
        ),
        const CustomDividerWidget(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:beit_alnakha_admin/core/animations/scale_transition_animation.dart';
import 'package:beit_alnakha_admin/core/animations/slide_transition_animation.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isActive,
    required this.smallSideBar,
    required this.isLastItem,
  });

  final String title;
  final String icon;
  final GestureTapCallback onTap;
  final bool isActive;
  final bool smallSideBar;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppSize.size12,
        top: isLastItem ? AppSize.size12 : 0,
        left:  AppSize.size16,
        right:  AppSize.size16,
      ),
      child: Material(
        color: isActive ? AppColors.primary : AppColors.black,
        borderRadius: BorderRadius.circular(AppSize.size16),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: AppSize.size48,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: smallSideBar
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                if (!smallSideBar) const Gap(AppSize.size16) else const Gap(0),
                if (isActive)
                  ScaleTransitionAnimation(
                    duration: const Duration(milliseconds: 500),
                    child: SlideTransitionAnimation(
                      duration: const Duration(milliseconds: 300),
                      begin: const Offset(1, 0),
                      end: const Offset(0, 0),
                      child: SvgPicture.asset(
                        icon,
                        colorFilter: ColorFilter.mode(
                          AppColors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  )
                else
                  SvgPicture.asset(
                    icon,
                    colorFilter: ColorFilter.mode(
                      AppColors.greyAA,
                      BlendMode.srcIn,
                    ),
                  ),
                if (!smallSideBar) ...[
                  const SizedBox(width: AppSize.size8),
                  Flexible(
                    child: Text(
                      title,
                      maxLines: 1,
                      style: AppStyles.medium15(context).copyWith(
                        color: isActive ? AppColors.white : AppColors.greyAA,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

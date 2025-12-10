import 'package:beit_alnakha_admin/core/functions/logout.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class LogoutSidBar extends StatelessWidget {
  const LogoutSidBar({super.key, required this.smallSideBar});

  final bool smallSideBar;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryBlack,
      borderRadius: BorderRadius.circular(AppSize.size16),
      clipBehavior: Clip.antiAlias,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppSize.size40, left: AppSize.size16, right: AppSize.size16),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppSize.size16),
            radius: AppSize.size16,
            onTap: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return CustomDialog(
                    iconSvgPath: AppAssets.logout,
                    iconBackgroundColor: AppColors.redWithOpacity10,
                    iconSvgColor: AppColors.red2D,
                    buttonColorForPrimaryButton: AppColors.red2D,
                    buttonTitleForPrimaryButton: AppStrings.logout,
                    buttonTitleForSecondaryButton: AppStrings.cancel,
                    title: AppStrings.logout,
                    subtitle: AppStrings.areYouSureLogout,
                  );
                },
              ).then((value) {
                if (value == true && value != null) {
                  logout();
                }
              });
            },
            child: Container(
              height: AppSize.size48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondaryBlack,
                borderRadius: BorderRadius.circular(AppSize.size16),
              ),
              child: Row(
                mainAxisAlignment: smallSideBar
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  if (smallSideBar) const Gap(0) else const Gap(AppSize.size16),
                  if (smallSideBar)
                    SvgPicture.asset(AppAssets.logout)
                  else ...[
                    SvgPicture.asset(AppAssets.logout),
                    const Gap(AppSize.size10),
                    Flexible(
                      child: Text(
                        AppStrings.logout,
                        maxLines: 1,
                        style: AppStyles.medium15(
                          context,
                        ).copyWith(color: AppColors.primary),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:beit_alnakha_admin/core/animations/scale_transition_animation.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_elevated_button.dart';

class CustomDialog extends StatelessWidget {
  final String iconSvgPath;
  final String? title;
  final String? subtitle;
  final double? width;
  final Color? iconBackgroundColor;
  final Color? iconSvgColor;
  final Color? buttonColorForPrimaryButton;
  final Color? buttonColorForSecondary;
  final String buttonTitleForPrimaryButton;
  final String buttonTitleForSecondaryButton;
  final Widget? child;
  final VoidCallback? primaryOnPressed;

  const CustomDialog({
    super.key,
    required this.iconSvgPath,
    this.iconBackgroundColor,
    this.iconSvgColor,
    this.title,
    this.subtitle,
    this.width,
    this.buttonColorForPrimaryButton,
    this.buttonColorForSecondary,
    required this.buttonTitleForPrimaryButton,
    required this.buttonTitleForSecondaryButton,
    this.child,
    this.primaryOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransitionAnimation(
      duration: const Duration(milliseconds: 500),
      child: AlertDialog(
        titlePadding: const EdgeInsets.only(top: AppSize.size12),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.size12)),
        ),
        contentPadding: const EdgeInsets.all(AppSize.size16),
        title: CircleAvatar(
          radius: 25,
          backgroundColor: iconBackgroundColor ?? AppColors.grey200,
          child: SvgPicture.asset(
            iconSvgPath,
            colorFilter: ColorFilter.mode(
              iconSvgColor ?? AppColors.black46,
              BlendMode.srcIn,
            ),
          ),
        ),
        content: SizedBox(
          width: width ?? 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      title != null
                          ? Text(
                              title!,
                              textAlign: TextAlign.center,
                              style: AppStyles.medium16(context),
                            )
                          : const SizedBox.shrink(),
                      subtitle != null
                          ? Text(
                              subtitle!,
                              textAlign: TextAlign.center,
                              style: AppStyles.medium15(
                                context,
                              ).copyWith(color: AppColors.grey7A),
                            )
                          : const SizedBox.shrink(),
                      ?child,
                    ],
                  ),
                ),
              ),
              const Gap(AppSize.size16),
              Row(
                spacing: AppSize.size8,
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed:
                          primaryOnPressed ??
                          () {
                            context.pop(true);
                          },
                      title: buttonTitleForPrimaryButton,
                      borderRadius: AppSize.size12,
                      textStyle: AppStyles.medium14(
                        context,
                      ).copyWith(color: AppColors.white),
                      backgroundColor:
                          buttonColorForPrimaryButton ?? AppColors.primary,
                    ),
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {
                        context.pop(false);
                      },
                      title: buttonTitleForSecondaryButton,
                      titleColor: AppColors.black46,
                      enableBorder: true,
                      borderRadius: AppSize.size12,
                      textStyle: AppStyles.medium14(
                        context,
                      ).copyWith(color: AppColors.black46),

                      backgroundColor:
                          buttonColorForSecondary ?? AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

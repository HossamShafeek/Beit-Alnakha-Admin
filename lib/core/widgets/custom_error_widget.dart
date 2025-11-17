import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    this.paddingForTop,
    this.paddingForBottom,
    this.imageSize,
  });

  final String imagePath;
  final String title;

  final String subtitle;
  final double? paddingForTop;
  final double? paddingForBottom;
  final double? imageSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.only(
              left: AppSize.size16,
              right: AppSize.size16,
              bottom: paddingForBottom ?? 0,
              top: paddingForTop ?? 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(imagePath, height: imageSize ?? 200),
                Gap(AppSize.size20),
                Text(
                  title,
                  style: AppStyles.medium17(
                    context,
                  ).copyWith(color: AppColors.primary, height: 1.5),
                ),
                Gap(AppSize.size4),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: AppStyles.regular16(
                    context,
                  ).copyWith(color: AppColors.black46, height: 1.5),
                ),
                const Gap(AppSize.size26),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 420, minWidth: 300),
                  child: CustomElevatedButton(
                    height: AppSize.size48,
                    onPressed: onPressed,
                    title: AppStrings.tryAgain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

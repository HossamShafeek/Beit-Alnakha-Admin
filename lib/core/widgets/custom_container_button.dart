import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';

class CustomContainerButton extends StatelessWidget {
  const CustomContainerButton({
    super.key,
    this.size,
    required this.imagePath,
    this.iconColor,
    this.padding,
    this.radius,
    this.onTap,
    this.backgroundColor,
  });

  final double? size;
  final String imagePath;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? padding;
  final double? radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      overlayColor: WidgetStatePropertyAll(AppColors.transparent),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(padding ?? 0),
        width: size ?? AppSize.size48,
        height: size ?? AppSize.size48,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.secondaryBlack,
          borderRadius: BorderRadius.circular(radius ?? AppSize.size12),
        ),
        child: SvgPicture.asset(
          imagePath,
          width: AppSize.size24,
          height: AppSize.size24,
          colorFilter: ColorFilter.mode(
            iconColor ?? AppColors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

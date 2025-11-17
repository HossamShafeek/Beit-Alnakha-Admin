import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.titleColor,
    this.backgroundColor,
    this.enableBorder = false,
    this.icon,
    this.mainAxisAlignment,
    this.textStyle,
    this.height,
    this.width,
    this.borderRadius,
  });

  final VoidCallback? onPressed;
  final String title;
  final Color? titleColor, backgroundColor;
  final bool? enableBorder;
  final Widget? icon;
  final MainAxisAlignment? mainAxisAlignment;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        maximumSize: WidgetStatePropertyAll(
          Size(width ?? double.infinity, height ?? AppSize.size52),
        ),
        minimumSize: WidgetStatePropertyAll(
          Size(width ?? double.infinity, height ?? AppSize.size52),
        ),
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? AppColors.primary,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? AppSize.size12),
            side: enableBorder!
                ? BorderSide(width: AppSize.borderSize, color: AppColors.greyE7)
                : BorderSide.none,
          ),
        ),
        elevation: WidgetStateProperty.all(0),
      ),
      onPressed: onPressed,
      child: FittedBox(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          spacing: AppSize.size4,
          children: [
            icon ?? SizedBox.shrink(),
            Text(
              title,
              style:
                  textStyle ??
                  AppStyles.semiBold16(
                    context,
                  ).copyWith(color: titleColor ?? AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}

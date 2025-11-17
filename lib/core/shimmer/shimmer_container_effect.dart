import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainerEffect extends StatelessWidget {
  const ShimmerContainerEffect({
    super.key,
    this.width,
    this.height,
    this.borderRadiusNumber,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.borderRadius,
  });

  final double? width;
  final double? height;
  final double? borderRadiusNumber;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.withAlpha((0.3 * 255).toInt()),
      highlightColor: AppColors.white.withAlpha((0.6 * 255).toInt()),
      child: Container(
        margin: margin,
        width: width,
        height: height ?? AppSize.size10,
        decoration: BoxDecoration(
          color: AppColors.white.withAlpha((0.9 * 255).toInt()),
          borderRadius:
              borderRadius ??
              BorderRadius.circular(borderRadiusNumber ?? AppSize.size8),
        ),
      ),
    );
  }
}

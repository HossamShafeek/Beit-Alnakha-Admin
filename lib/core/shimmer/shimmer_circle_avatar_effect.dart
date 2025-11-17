import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCircleAvatarEffect extends StatelessWidget {
  const ShimmerCircleAvatarEffect({super.key, this.radius});

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.withAlpha((0.3 * 255).toInt()),
      highlightColor: AppColors.white.withAlpha((0.6 * 255).toInt()),
      child: CircleAvatar(
        backgroundColor: AppColors.white.withAlpha((0.9 * 255).toInt()),
        radius: radius ?? AppSize.size8,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:beit_alnakha_admin/core/shimmer/shimmer_circle_avatar_effect.dart';
import 'package:beit_alnakha_admin/core/shimmer/shimmer_container_effect.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';

class ShimmerDiagnosticListView extends StatelessWidget {
  const ShimmerDiagnosticListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppSize.size8,
              horizontal: AppSize.size12,
            ),
            decoration: BoxDecoration(
              color: AppColors.grey200,
              borderRadius: BorderRadius.circular(AppSize.size12),
            ),
            child: Row(
              children: const [
                ShimmerCircleAvatarEffect(radius: AppSize.size20),
                Gap(AppSize.size12),
                ShimmerContainerEffect(width: 90),
                Spacer(),
                Column(
                  spacing: AppSize.size3,
                  children: [
                    ShimmerCircleAvatarEffect(radius: AppSize.size3),
                    ShimmerCircleAvatarEffect(radius: AppSize.size3),
                    ShimmerCircleAvatarEffect(radius: AppSize.size3),
                  ],
                ),
                Gap(AppSize.size8),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSize.size8),
        itemCount: 20,
      ),
    );
  }
}

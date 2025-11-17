import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:beit_alnakha_admin/core/shimmer/shimmer_circle_avatar_effect.dart';
import 'package:beit_alnakha_admin/core/shimmer/shimmer_container_effect.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';

class ShimmerPackagesListView extends StatelessWidget {
  const ShimmerPackagesListView({super.key, required this.isEdit});

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.size12,
                vertical: AppSize.size8,
              ),
              decoration: BoxDecoration(
                color: isEdit ? AppColors.grey200 : AppColors.white,
                borderRadius: BorderRadius.circular(AppSize.size12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerContainerEffect(width: 100),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ShimmerCircleAvatarEffect(radius: 11),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      ShimmerCircleAvatarEffect(radius: AppSize.size5),
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const Gap(AppSize.size10),
          itemCount: 3,
        ),
        if (isEdit) const Gap(AppSize.size30),
      ],
    );
  }
}

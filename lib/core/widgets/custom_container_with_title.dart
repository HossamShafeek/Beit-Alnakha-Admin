import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';

class CustomContainerWithTitle extends StatelessWidget {
  const CustomContainerWithTitle({super.key, this.title, required this.child});

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSize.size12),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(AppSize.size12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSize.size8,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: AppStyles.medium16(
                context,
              ).copyWith(color: AppColors.secondaryBlack),
            ),
          ],
          child,
        ],
      ),
    );
  }
}

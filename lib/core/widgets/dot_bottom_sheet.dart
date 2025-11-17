import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';

class DotBottomSheet extends StatelessWidget {
  const DotBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: AppSize.size6,
        width: AppSize.size48,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: AppSize.size8),
        decoration: BoxDecoration(
          color: AppColors.greyD8,
          borderRadius: BorderRadius.circular(AppSize.size12),
        ),
      ),
    );
  }
}

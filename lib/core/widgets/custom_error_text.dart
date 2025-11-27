import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomErrorText extends StatelessWidget {
  final String error;

  const CustomErrorText({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        textAlign: TextAlign.center,
        style: AppStyles.semiBold16(context).copyWith(color: AppColors.primaryBlack),
      ),
    );
  }
}

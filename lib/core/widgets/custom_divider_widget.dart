import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.greyE7,
      thickness: AppSize.size1,
      height: 0,
    );
  }
}

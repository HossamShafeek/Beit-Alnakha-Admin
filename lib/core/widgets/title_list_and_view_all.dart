import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_text_button.dart';

class TitleListAndViewAll extends StatelessWidget {
  const TitleListAndViewAll({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.medium16(context).copyWith(color: AppColors.black46),
        ),
        CustomTextButton(onPressed: onPressed, title: AppStrings.viewAll),
      ],
    );
  }
}

import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
     this.hintText
  });

  final TextEditingController controller;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;
  final FocusNode? focusNode;
  final String? hintText ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      focusNode: focusNode,
      controller: controller,
      style: AppStyles.regular16(context),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        enabled: true,
        hintText: hintText ?? AppStrings.searchHintTextByName,
        prefixIcon: SizedBox(
          width: AppSize.size24,
          height: AppSize.size24,
          child: Center(
            child: SvgPicture.asset(
              AppAssets.search,
              width: AppSize.size24,
              height: AppSize.size24,
            ),
          ),
        ),
        filled: true,
        hintStyle: AppStyles.regular16(
          context,
        ).copyWith(color: AppColors.grey88),
        fillColor: AppColors.white,
        border: AppConstants.enabledBorder,
        enabledBorder: AppConstants.enabledBorder.copyWith(
          borderRadius: BorderRadius.circular(AppSize.size24),
        ),
        focusedBorder: AppConstants.focusedBorder.copyWith(
          borderRadius: BorderRadius.circular(AppSize.size24),
        ),
      ),
    );
  }
}

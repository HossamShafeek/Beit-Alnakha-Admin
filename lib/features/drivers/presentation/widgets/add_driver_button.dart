import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddDriverButton extends StatelessWidget {
  const AddDriverButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      width: 160,
      onPressed: () {},
      title: AppStrings.addDriver,
      icon: SvgPicture.asset(
        AppAssets.add,
        colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      ),
    );
  }
}
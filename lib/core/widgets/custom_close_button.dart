import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: Icon(
        Icons.close_rounded,
        size: AppSize.size24,
        color: AppColors.black,
      ),
      splashRadius: AppSize.size24,
    );
  }
}

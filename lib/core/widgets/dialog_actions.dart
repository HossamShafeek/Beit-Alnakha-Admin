import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogActions extends StatelessWidget {
  const DialogActions({
    super.key,
    this.buttonTitle,
    required this.onPressed,
    this.removeCancelButton = false,
  });

  final String? buttonTitle;
  final VoidCallback onPressed;
  final bool removeCancelButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.size16),
      child: Row(
        spacing: AppSize.size12,
        children: [
          Expanded(
            child: CustomElevatedButton(
              onPressed: onPressed,
              title: buttonTitle ?? AppStrings.add,
            ),
          ),
          if (!removeCancelButton) ...[
            Expanded(
              child: CustomElevatedButton(
                onPressed: () {
                  context.pop();
                },
                title: AppStrings.cancel,
                backgroundColor: AppColors.white,
                enableBorder: true,
                titleColor: AppColors.black,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

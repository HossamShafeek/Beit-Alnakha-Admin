import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TitleAndValueWidget extends StatelessWidget {
  const TitleAndValueWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.colorTitle,
    this.colorSubtitle,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.viewIraqCurrencyText = true,
  });

  final String title;
  final String subtitle;
  final Color? colorTitle;
  final Color? colorSubtitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final bool? viewIraqCurrencyText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
          titleTextStyle ??
              AppStyles.medium16(
                context,
              ).copyWith(color: colorTitle ?? AppColors.grey7A),
        ),
        Flexible(
          child: Text(
            viewIraqCurrencyText!
                ? '$subtitle ${AppStrings.iraqCurrency}'
                : subtitle,
            textDirection: TextDirection.rtl,
            style:
            subtitleTextStyle ??
                AppStyles.medium16(
                  context,
                ).copyWith(color: colorSubtitle ?? AppColors.black5B),
          ),
        ),
      ],
    );
  }
}
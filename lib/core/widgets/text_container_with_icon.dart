import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextContainerWithIcon extends StatelessWidget {
  const TextContainerWithIcon({
    super.key,
    this.iconSvgPath,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.iconColor,
    this.textStyle,
    this.width,
    this.height,
    this.disabledMaxLine=false,
  });

  final String text;
  final String? iconSvgPath;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final bool disabledMaxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width ,
      height: height,
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.size12,
        vertical: (AppSize.size4),
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.grey100,
        borderRadius: BorderRadius.circular(AppSize.size8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppSize.size4,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconSvgPath != null) ...[
            SvgPicture.asset(
              iconSvgPath!,
              width: AppSize.size20,
              height: AppSize.size20,
              colorFilter: iconColor != null
                  ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                  : null,
            ),
          ],
          Flexible(
            child: SingleChildScrollView(
              child: Text(
                text,
                textAlign: TextAlign.start,
               maxLines:disabledMaxLine? null:1,
                overflow: disabledMaxLine?null:TextOverflow.ellipsis,
                style:
                    textStyle ??

                    AppStyles.semiBold14(
                      context,
                    ).copyWith(color: textColor ?? AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

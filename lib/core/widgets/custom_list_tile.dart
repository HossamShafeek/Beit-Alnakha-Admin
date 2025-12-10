import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
     this.titleText,
    this.svgIconPath,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.backgroundIconColor,
    this.trailing,
    this.trailingTitle,
    this.horizontalTitleGap,
    this.expandedTitle = false,
    this.paddingForTop,
    this.paddingForBottom,
    this.trailingTitleColor,
    this.titleWidget,
  });

  final String? titleText;
  final Widget? titleWidget;
  final String? trailingTitle;
  final VoidCallback? onTap;
  final String? svgIconPath;
  final Color? iconColor;
  final Color? trailingTitleColor;
  final Color? backgroundIconColor;
  final Color? backgroundColor;
  final Widget? trailing;
  final double? horizontalTitleGap;
  final bool? expandedTitle;
  final double? paddingForTop;
  final double? paddingForBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingForTop ?? 0,
        bottom: paddingForBottom ?? 0,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(AppSize.size12),
        child: ListTile(
          onTap: onTap,
          hoverColor: AppColors.grey300,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppSize.size12,
            vertical: AppSize.size4,
          ),
          horizontalTitleGap: horizontalTitleGap ?? AppSize.size5,
          dense: true,
          minLeadingWidth: AppSize.size30,
          tileColor: backgroundColor ?? AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.size12),
          ),
          leading: svgIconPath != null
              ? CircleAvatar(
                  backgroundColor: backgroundIconColor ?? AppColors.transparent,
                  child: SvgPicture.asset(
                    svgIconPath!,
                    colorFilter: ColorFilter.mode(
                      iconColor ?? AppColors.grey7A,
                      BlendMode.srcIn,
                    ),
                    width: AppSize.size24,
                    height: AppSize.size24,
                  ),
                )
              : null,
          title: Row(
            spacing: AppSize.size8,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (expandedTitle!) ...[
              titleWidget ??  Flexible(
                  child: Text(
                    titleText??'',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                    style: AppStyles.medium16(
                      context,
                    ).copyWith(color: AppColors.grey7A),
                  ),
                ),
                trailing ??
                    Text(
                      trailingTitle ?? '',
                      maxLines: 1,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.medium16(
                        context,
                      ).copyWith(color:trailingTitleColor?? AppColors.black5B),
                    ),
              ] else ...[
                titleWidget??     Text(
                  titleText??'',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: AppStyles.medium16(
                    context,
                  ).copyWith(color: AppColors.grey7A),
                ),
                Flexible(
                  child:
                      trailing ??
                      Text(
                        trailingTitle ?? '',
                        maxLines: 1,
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.medium16(
                          context,
                        ).copyWith(color: trailingTitleColor??AppColors.black5B),
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

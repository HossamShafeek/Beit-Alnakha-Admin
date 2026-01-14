import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.titles,
    this.onTap,
    this.paddingForLeft,
    this.paddingForRight,
  });

  final List<String> titles;
  final void Function(int index)? onTap;
  final double? paddingForLeft;
  final double? paddingForRight;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left:
            widget.paddingForLeft ??
            context.withFormFactor(
              onMobile: AppSize.size16,
              onTablet: AppSize.size24,
              onDesktop: AppSize.size24,
            ),
        right:
            widget.paddingForRight ??
            context.withFormFactor(
              onMobile: AppSize.size16,
              onTablet: AppSize.size24,
              onDesktop: AppSize.size24,
            ),
      ),
      child: SizedBox(
        height: AppSize.size40,
        width: double.infinity,
        child: TabBar(
          onTap: (index) {
            widget.onTap!(index);
            setState(() {
              currentIndex = index;
            });
          },
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,

          indicatorPadding: const EdgeInsetsDirectional.only(
            end: AppSize.size8,
          ),
          labelPadding: const EdgeInsetsDirectional.only(end: 8),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.size10),
            color: AppColors.primary,
          ),

          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          splashBorderRadius: BorderRadius.circular(AppSize.size10),
          unselectedLabelColor: AppColors.black5B,
          labelColor: AppColors.white,
          labelStyle: AppStyles.medium14(context),
          unselectedLabelStyle: AppStyles.medium14(context),
          dividerHeight: 0,
          indicatorWeight: 0,
          tabs: widget.titles
              .map(
                (status) => Container(
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: currentIndex == widget.titles.indexOf(status)
                        ? 16
                        : AppSize.size16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.size10),
                    color: currentIndex == widget.titles.indexOf(status)
                        ? AppColors.transparent
                        : AppColors.grey100,
                  ),
                  child: Text(status),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

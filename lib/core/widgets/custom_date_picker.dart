import 'package:flutter_svg/svg.dart';
import 'package:beit_alnakha_admin/core/animations/scale_transition_animation.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/pop_on_resize.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
    this.title,
    this.validator,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.textInputType,
    this.enabledPasswordVisibility,
    this.paddingForTop,
    this.paddingForBottom,
    this.maxLines,
    this.onTapOutsideUnFocus,
    this.backgroundColor,
    this.height,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final String? title;
  final int? maxLength;
  final TextInputType? textInputType;
  final bool? enabledPasswordVisibility;
  final double? paddingForTop;
  final double? height;
  final double? paddingForBottom;
  final int? maxLines;
  final bool? onTapOutsideUnFocus;
  final Color? backgroundColor;

  @override
  State<CustomDatePicker> createState() => _CustomDateRangePickerState();
}

class _CustomDateRangePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.paddingForBottom ?? AppSize.size12,
        top: widget.paddingForTop ?? 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: widget.title == null ? 0 : AppSize.size6,
        children: [
          if (widget.title != null && widget.title != '') ...{
            Text(
              widget.title!,
              style: AppStyles.regular16(
                context,
              ).copyWith(color: AppColors.black2A),
            ),
          },
          TextFormField(
            readOnly: true,
            style: AppStyles.regular16(context),
            maxLines: widget.maxLines ?? 1,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            maxLength: widget.maxLength,
            validator: widget.validator,
            onTap: () {
              showDatePicker(
                context: context,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                firstDate: DateTime(2000),
                lastDate: DateTime(DateTime.now().year + 10),
                initialDate: DateTime.now(),
                builder: (context, child) {
                  return PopOnResize(
                    child: ScaleTransitionAnimation(
                      duration: const Duration(milliseconds: 500),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          appBarTheme: const AppBarTheme(
                            elevation: 0,
                            toolbarHeight: 60,
                            backgroundColor: AppColors.primary,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              textStyle: AppStyles.regular16(context),
                            ),
                          ),
                          iconTheme: const IconThemeData(
                            size: AppSize.size20,
                            color: Colors.white,
                          ),

                          primaryColor: AppColors.primary,
                          colorScheme: const ColorScheme.light(
                            primary: AppColors.primary,
                            secondary: Color.fromRGBO(3, 68, 122, 0.2),
                          ),
                          textTheme: TextTheme(
                            // for top app bar date
                            headlineSmall: AppStyles.regular16(context),
                            // for days in calendar
                            bodyMedium: AppStyles.regular14(context),
                            // for title in app bar
                            labelSmall: AppStyles.regular14(context),
                          ),
                        ),

                        child: child!,
                      ),
                    ),
                  );
                },
              ).then((value) {
                if (value != null) {
                  widget.controller.text =
                      '${value.day}/${value.month}/${value.year}';
                }
              });
            },
            decoration: InputDecoration(
              enabled: true,
              constraints: widget.height != null
                  ? BoxConstraints(
                      maxHeight: widget.height!,
                      minHeight: widget.height!,
                    )
                  : null,
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSize.size12,
                horizontal: AppSize.size16,
              ),
              hintText: widget.hintText,
              errorStyle: AppStyles.medium12(
                context,
              ).copyWith(color: AppColors.red),
              suffixIcon: widget.suffixIcon,
              prefixIcon:
                  widget.prefixIcon ??
                  SizedBox(
                    width: AppSize.size24,
                    height: AppSize.size24,
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.date,
                        width: AppSize.size24,
                        height: AppSize.size24,
                      ),
                    ),
                  ),
              filled: true,
              isDense: true,
              hintStyle: AppStyles.regular16(
                context,
              ).copyWith(color: AppColors.grey7A),
              fillColor: widget.backgroundColor ?? AppColors.white,
              border: AppConstants.enabledBorder,
              enabledBorder: AppConstants.enabledBorder,
              focusedBorder: AppConstants.enabledBorder,
              errorBorder: AppConstants.errorBorder,
              focusedErrorBorder: AppConstants.errorBorder,
            ),
          ),
        ],
      ),
    );
  }
}

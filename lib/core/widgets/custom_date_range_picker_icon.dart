import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/animations/scale_transition_animation.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_button.dart';

class CustomDateRangePickerIcon extends StatefulWidget {
  const CustomDateRangePickerIcon({
    super.key,
    this.onDateRangeSelected,
    required this.controller,
    this.onClearDateRange,
  });

  final Function(DateTimeRange?)? onDateRangeSelected;
  final TextEditingController controller;
  final VoidCallback? onClearDateRange;

  @override
  State<CustomDateRangePickerIcon> createState() =>
      _CustomDateRangePickerIconState();
}

class _CustomDateRangePickerIconState extends State<CustomDateRangePickerIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topEnd,
      children: [
        CustomContainerButton(
          imagePath: AppAssets.date,
          onTap: () {
            showDateRangePicker(
              context: context,
              initialEntryMode: DatePickerEntryMode.calendarOnly,
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
              initialDateRange: DateTimeRange(
                start: DateTime.now(),
                end: DateTime.now(),
              ),
              builder: (context, child) {
                return ScaleTransitionAnimation(
                  duration: const Duration(milliseconds: 500),
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.size12),
                    ),
                    contentPadding: EdgeInsets.zero,
                    clipBehavior: Clip.antiAlias,
                    content: SizedBox(
                      width: 400,
                      height: 480,
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
                  ),
                );
              },
            ).then((value) {
              if (value != null) {
                widget.controller.text =
                    '${value.start.day}/${value.start.month}/${value.start.year},${value.end.day}/${value.end.month}/${value.end.year}';
                if (widget.onDateRangeSelected != null) {
                  widget.onDateRangeSelected!(value);
                }
                setState(() {});
              }
            });
          },
        ),
        if (widget.controller.text.isNotEmpty) ...[
          Positioned(
            top: -8,
            left: -8,
            child: InkWell(
              onTap: () {
                widget.controller.clear();
                if (widget.onClearDateRange != null) {
                  widget.onClearDateRange!();
                }
                setState(() {});
              },
              borderRadius: BorderRadius.circular(AppSize.size24),
              child: CircleAvatar(
                radius: AppSize.size12,
                backgroundColor: AppColors.primary,
                child: const Icon(
                  Icons.close_rounded,
                  size: AppSize.size16,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

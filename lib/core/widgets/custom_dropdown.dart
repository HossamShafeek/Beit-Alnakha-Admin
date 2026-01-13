import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.controller,
    this.validator,
    this.suffixIcon,
    required this.hintText,
    this.prefixIcon,
    this.onTapOutsideUnFocus = true,
    required this.items,
    this.onChanged,
    this.offset,
    this.title,
    this.height,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final String? title;
  final bool? onTapOutsideUnFocus;
  final Offset? offset;
  final List<PopupMenuEntry> items;
  final void Function(String)? onChanged;
  final double? height;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  double? lastWidth;

  bool isPopupOpen = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double currentScreenWidth = context.width;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (lastWidth != null && currentScreenWidth != lastWidth) {
            if (isPopupOpen) {
              Navigator.of(context, rootNavigator: true).pop();
              isPopupOpen = false;
            }
          }
          lastWidth = currentScreenWidth;
        });

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: widget.title == null ? 0 : AppSize.size6,
          children: [
            if (widget.title != null) ...{
              Text(
                widget.title!,
                style: AppStyles.regular16(
                  context,
                ).copyWith(color: AppColors.black),
              ),
            },
            TextFormField(
              onChanged: widget.onChanged,
              readOnly: true,
              onTapOutside: (value) {
                if (widget.onTapOutsideUnFocus!) {
                  FocusScope.of(context).unfocus();
                }
              },
              onTap: () {
                isPopupOpen = true;
                final RenderBox renderBox =
                    context.findRenderObject() as RenderBox;
                final Offset position = renderBox.localToGlobal(
                  const Offset(0, 5),
                );
                showMenu(
                  useRootNavigator: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.size12),
                  ),
                  position: RelativeRect.fromLTRB(
                    position.dx,
                    position.dy + renderBox.size.height,
                    position.dx + renderBox.size.width,
                    position.dy + renderBox.size.height + 100,
                  ),
                  // Adjust position as needed
                  items: widget.items,
                ).then((value) {
                  isPopupOpen = false;
                  if (value != null) {
                    widget.controller.text = value;
                  }
                });
              },
              style: AppStyles.regular16(context),
              maxLines: 1,
              controller: widget.controller,
              validator: widget.validator,
              decoration: InputDecoration(
                enabled: true,
                isDense: true,
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
                suffixIcon:
                    widget.suffixIcon ??
                    InkWell(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SvgPicture.asset(
                          AppAssets.arrowDown,
                          width: AppSize.size24,
                          height: AppSize.size24,
                        ),
                      ),
                    ),
                prefixIcon: widget.prefixIcon,
                filled: true,
                hintStyle: AppStyles.regular16(
                  context,
                ).copyWith(color: AppColors.grey7A),
                fillColor: AppColors.white,
                border: AppConstants.enabledBorder.copyWith(
                  borderRadius: BorderRadius.circular(AppSize.size24),
                ),
                enabledBorder: AppConstants.enabledBorder.copyWith(
                  borderRadius: BorderRadius.circular(AppSize.size24),
                ),
                focusedBorder: AppConstants.enabledBorder.copyWith(
                  borderRadius: BorderRadius.circular(AppSize.size24),
                ),
                errorBorder: AppConstants.errorBorder.copyWith(
                  borderRadius: BorderRadius.circular(AppSize.size24),
                ),
                focusedErrorBorder: AppConstants.errorBorder.copyWith(
                  borderRadius: BorderRadius.circular(AppSize.size24),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

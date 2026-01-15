import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    this.suffixIcon,
    required this.hintText,
    this.maxLength,
    this.textInputType,
    this.obscureText = false,
    this.prefixIcon,
    this.paddingForTop,
    this.paddingForBottom,
    this.maxLines,
    this.readOnly = false,
    this.onTapOutsideUnFocus = true,
    this.onTap,
    this.backgroundColor,
    this.title,
    this.onChanged,
    this.enabledPasswordVisibility = false,
    this.onFieldSubmitted,
    this.maxLinesEqualNull = false,
    this.textDirection,
    this.textAlign,
    this.passwordVisibilityColor,
    this.textStyleColor,
    this.hintStyleColor,
    this.enabledBorder,
    this.focusedBorder,
    this.hoverColor,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function(String value)? onChanged;
  final Function(String value)? onFieldSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final String? title;
  final int? maxLength;
  final TextInputType? textInputType;
  final bool obscureText;
  final bool? enabledPasswordVisibility;
  final double? paddingForTop;
  final double? paddingForBottom;
  final int? maxLines;
  final bool? onTapOutsideUnFocus;
  final bool readOnly;
  final bool maxLinesEqualNull ;
  final Color? backgroundColor;
  final Color? passwordVisibilityColor;
  final Color? textStyleColor;
  final Color? hintStyleColor;
  final Color? hoverColor;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

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
              ).copyWith(color:widget.textStyleColor?? AppColors.black2A),
            ),
          },
          TextFormField(

            textDirection: widget.textDirection,
            textAlign: widget.textAlign?? TextAlign.start,
            onChanged: widget.onChanged,
            readOnly: widget.readOnly,
            obscuringCharacter: '•',
            onFieldSubmitted: widget.onFieldSubmitted,
            onTapOutside: (value) {
              if (widget.onTapOutsideUnFocus!) {
                FocusScope.of(context).unfocus();
              }
            },
            inputFormatters: widget.inputFormatters,
            style: AppStyles.regular16(context).copyWith(
           color:      widget.textStyleColor??AppColors.black
            ),
            maxLines:widget.maxLinesEqualNull ? null : widget.maxLines ?? 1,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            maxLength: widget.maxLength,
            obscureText: _obscureText,
            validator: widget.validator,
            onTap: widget.onTap,

            decoration: InputDecoration(
              enabled: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSize.size13,
                horizontal: AppSize.size16,
              ),
              hintText: widget.hintText,
              errorStyle: AppStyles.medium12(
                context,
              ).copyWith(color: AppColors.red),
              suffixIcon: widget.enabledPasswordVisibility!
                  ? _buildToggleVisibilityButton()
                  : widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              filled: true,
              isDense: true,
              hintStyle: AppStyles.regular16(
                context,
              ).copyWith(color: widget.hintStyleColor??AppColors.grey88),
              fillColor: widget.backgroundColor ?? AppColors.white,
              hoverColor:  widget.hoverColor ?? AppColors.grey200,
              border: widget.enabledBorder ?? AppConstants.removeBorder,
              enabledBorder: widget.enabledBorder ?? AppConstants.removeBorder,
              focusedBorder:widget.focusedBorder ?? AppConstants.focusedBorder,
              errorBorder: AppConstants.errorBorder,
              focusedErrorBorder: AppConstants.errorBorder,
            ),
          ),
        ],
      ),
    );
  }
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _buildToggleVisibilityButton() {
    return InkWell(

      borderRadius: BorderRadius.circular(AppSize.size72),
      onTap: _togglePasswordVisibility,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) => SizeTransition(
          sizeFactor: animation,
          axis: Axis.horizontal,
          axisAlignment: -1.0,
          child: child,
        ),
        child: SvgPicture.asset(
          _obscureText ? AppAssets.hide : AppAssets.show,
          key: ValueKey<bool>(_obscureText),
          colorFilter: ColorFilter.mode(
            widget.passwordVisibilityColor??  AppColors.grey7A,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

}

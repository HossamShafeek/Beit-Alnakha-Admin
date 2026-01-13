import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:beit_alnakha_admin/core/helper/phone_length_helper.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';

class CustomPhoneField extends StatefulWidget {
  const CustomPhoneField({
    super.key,
    required this.controller,
    this.paddingForTop,
    this.paddingForBottom,
    this.readOnly = false,
    this.onTapOutsideUnFocus = true,
    this.onTap,
    this.backgroundColor,
    this.onChanged,
    this.enabledPasswordVisibility = false,
    this.showTitle = false,
    this.onFieldSubmitted,
    this.enabledBorder,
    this.focusedBorder,
  });

  final TextEditingController controller;
  final Function()? onTap;
  final Function(String value)? onChanged;
  final Function(String value)? onFieldSubmitted;
  final bool? enabledPasswordVisibility;
  final double? paddingForTop;
  final double? paddingForBottom;
  final bool? onTapOutsideUnFocus;
  final bool readOnly;
  final bool? showTitle;
  final Color? backgroundColor;
  final InputBorder? enabledBorder ;
  final InputBorder? focusedBorder ;

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  late TextEditingController _controller;
  int? _maxLength;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.initializeCountryCode('964');
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
    _updateMaxLength();
  }

  void _updateMaxLength() {
    setState(() {
      _maxLength =
          PhoneHelper.countryPhoneLengths[_controller.selectedCountryCode];
    });
  }

  @override
  void dispose() {
    _controller.clearCountryCode();
    //  _controller.dispose();

    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countryCodes = PhoneHelper.countryPhoneLengths.keys.toList();
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.paddingForBottom ?? AppSize.size12,
        top: widget.paddingForTop ?? 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: widget.showTitle! ? AppSize.size6 : 0,
        children: [
          if (widget.showTitle!) ...{
            Text(
              AppStrings.phoneNumber,
              style: AppStyles.regular16(
                context,
              ).copyWith(color: AppColors.black2A),
            ),
          },
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.onChanged,
            readOnly: widget.readOnly,
            obscuringCharacter: '•',
            onFieldSubmitted: widget.onFieldSubmitted,
            onTapOutside: (value) {
              if (widget.onTapOutsideUnFocus!) {
                FocusScope.of(context).unfocus();
              }
            },
           maxLength: _maxLength,
            validator: (value) {
              if (value!.trim().isEmpty) {
                return AppStrings.pleaseEnterPhoneNumber;
              }else if(value.startsWith('0')){
                return AppStrings.doNotStartNumberWithZero;
              } else if (value.length < _maxLength!) {
                return AppStrings.pleaseEnterPhoneNumberValid;
              }
              return null;
            },
            focusNode: _focusNode,
            controller: widget.controller,
            maxLines: 1,
            textAlign: TextAlign.start,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
            ],
            style: AppStyles.regular16(context),
            onTap: widget.onTap,
            decoration: InputDecoration(
              enabled: true,
              counterStyle: AppStyles.regular12(
                context,
              ).copyWith(color: AppColors.grey7A, height: 0.4),
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSize.size12,
                horizontal: AppSize.size16,
              ),
              hintText: AppStrings.phoneNumber,
              errorStyle: AppStyles.medium12(
                context,
              ).copyWith(color: AppColors.red),
              suffixIcon: DropdownButton<String>(
                value: _controller.selectedCountryCode,
                borderRadius: BorderRadius.circular(AppSize.size12),
                menuMaxHeight: (context.height * 0.5).clamp(200, 600),
                menuWidth: (context.width * 0.3).clamp(100, 200),
                padding: EdgeInsetsDirectional.only(end: AppSize.size12),
                alignment: AlignmentDirectional.centerEnd,
                elevation: 16,

                icon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 5),
                  child: SvgPicture.asset(
                    AppAssets.arrowDown,
                    colorFilter: ColorFilter.mode(
                      AppColors.grey7A,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                underline: SizedBox(),

                items: List.generate(countryCodes.length, (index) {
                  String code = countryCodes[index];
                  String countryName = PhoneHelper.getCountryTitle(
                    code,
                    context.locale.languageCode,
                  );
                  return DropdownMenuItem<String>(
                    value: code,
                    child: Text(
                      '$countryName +$code',
                      style: AppStyles.regular14(
                        context,
                      ).copyWith(color: AppColors.grey7A),
                    ),
                  );
                }),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _controller.updateSelectedCountryCode(value);
                      _updateMaxLength();
                    });
                  }
                },
              ),
              prefixIcon: FittedBox(
                fit: BoxFit.scaleDown,
                child: Center(child: SvgPicture.asset(AppAssets.call)),
              ),
              filled: true,
              isDense: true,
              hintStyle: AppStyles.regular16(
                context,
              ).copyWith(color: AppColors.grey7A),
              hoverColor: AppColors.grey200,
              fillColor: widget.backgroundColor ?? AppColors.white,
              border:widget.enabledBorder?? AppConstants.removeBorder,
              enabledBorder: widget.enabledBorder??AppConstants.removeBorder,
              focusedBorder: widget.focusedBorder??AppConstants.focusedBorder,
              errorBorder: AppConstants.errorBorder,
              focusedErrorBorder: AppConstants.errorBorder,
            ),
          ),
        ],
      ),
    );
  }
}

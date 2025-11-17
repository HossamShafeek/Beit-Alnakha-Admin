import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:beit_alnakha_admin/features/authentication/data/models/authentication_model/authentication_model.dart';

import 'app_colors.dart';

class AppConstants {
  static String accessToken = '';
  static AuthenticationModel? authenticationModel;
  static const String pathForImages = 'assets/images/';
  static const String pathForSvg = 'assets/svg/';
  static const String pathForLottie = 'assets/lottie/';
  static const String onboardingKey = 'onboarding';

  static final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSize.size12),
    borderSide: BorderSide(width: AppSize.borderSize, color: AppColors.primary),
  );

  static final OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSize.size12),
    borderSide: BorderSide(width: AppSize.borderSize, color: AppColors.greyE7),
  );
  static final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSize.size12),
    borderSide: BorderSide(width: AppSize.borderSize, color: AppColors.red),
  );
  static final OutlineInputBorder removeBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSize.size12),
    borderSide: BorderSide.none,
  );

  static const SystemUiOverlayStyle systemUiOverlayStyleLight =
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.transparent,
      );
  static const SystemUiOverlayStyle systemUiOverlayStyleDark =
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      );

  static final List<BoxShadow> boxShadowForImage = [
    BoxShadow(
      spreadRadius: -2,
      color: Color(0xff101828).withAlpha(08),
      blurRadius: 6,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      spreadRadius: -4,
      color: Color(0xff101828).withAlpha(14),
      blurRadius: 16,
      offset: Offset(0, 12),
    ),
  ];
}

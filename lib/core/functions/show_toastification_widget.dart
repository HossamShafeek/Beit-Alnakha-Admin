import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';

import 'package:toastification/toastification.dart';

void showToastificationWidget({
  required String message,
  required BuildContext context,
  ToastificationType notificationType = ToastificationType.success,
  int duration = 2,
}) {
  toastification.show(
    context: context,
    title: Text(
      textAlign: TextAlign.center,
      message,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppStyles.medium16(context).copyWith(color: AppColors.primaryBlack),
    ),

    type: notificationType,
    style: ToastificationStyle.flat,
    alignment: context.width < ScreenWidthBreakpoints.desktop
        ? Alignment.topCenter
        : Alignment.topLeft,
    direction: TextDirection.rtl,
    borderSide: BorderSide(color: getBorderColor(notificationType), width: 1.5),
    autoCloseDuration: Duration(seconds: duration),
  );
}

Color getBorderColor(ToastificationType notificationType) {
  switch (notificationType) {
    case ToastificationType.success:
      return successColor;
    case ToastificationType.error:
      return errorColor;
    case ToastificationType.info:
      return infoColor;
    case ToastificationType.warning:
      return warningColor;
    default:
      return successColor;
  }
}

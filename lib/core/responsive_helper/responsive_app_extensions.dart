import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:flutter/cupertino.dart';

extension ResponsiveAppExtensions on BuildContext {
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  double get realScreenWidth => isLandscape
      ? MediaQuery.of(this).size.height
      : MediaQuery.of(this).size.width;

  double get realScreenHeight => isLandscape
      ? MediaQuery.of(this).size.width
      : MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get getIconsSizeForTextField {
    if (width < ScreenWidthBreakpoints.tablet) {
      return AppSize.size20;
    } else {
      return AppSize.size24;
    }
  }

  // example usage for grid view count
  T withFormFactor<T>({
    required T onMobile,
    required T onTablet,
    required T onDesktop,
    bool followDeviceOrientation = true,
  }) {
    //log('========== Screen width: $width ==========');
    if (width < ScreenWidthBreakpoints.tablet) {
      //log('onMobile');
      return onMobile;
    } else if (width < ScreenWidthBreakpoints.desktop) {
      //log('onTablet');
      return onTablet;
    } else {
      // log('onDesktop');
      return onDesktop;
    }
  }

  void popOnDesktop() {
    if (width > ScreenWidthBreakpoints.desktop) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (Navigator.of(this).canPop()) {
          Navigator.pop(this);
        }
      });
    }
  }
}

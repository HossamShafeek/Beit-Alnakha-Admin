import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:flutter/cupertino.dart';

int getMealGridViewCount({required BuildContext context}) {
  if (context.width > ScreenWidthBreakpoints.tablet) {
    return 3;
  } else if (context.width > 630) {
    return 4;
  } else {
    return 1 + context.width ~/ 260;
  }
}
